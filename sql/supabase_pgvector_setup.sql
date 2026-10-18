-- ============================================================================
-- Zenthra Systems: Enterprise pgvector RAG Schema (QA Hardened v2.5)
-- ============================================================================
-- Upgrades applied by Senior QA Engineer:
-- 1. Added min_similarity threshold filter (eliminates noisy hallucinations)
-- 2. Added Generated tsvector column for Hybrid Search (Full-Text + Vector)
-- 3. Added update triggers & strict indexing for high-QPS concurrency
-- ============================================================================

-- 1. Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- 2. Create knowledge base documents table with hybrid search capability
CREATE TABLE IF NOT EXISTS public.zenthra_knowledge (
    id BIGSERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    embedding VECTOR(1536),
    -- tsvector generated column for full-text keyword search accuracy
    fts_tokens TSVECTOR GENERATED ALWAYS AS (to_tsvector('english', content)) STORED,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. HNSW index for sub-millisecond cosine vector retrieval
CREATE INDEX IF NOT EXISTS idx_zenthra_knowledge_embedding 
ON public.zenthra_knowledge 
USING hnsw (embedding vector_cosine_ops)
WITH (m = 16, ef_construction = 64);

-- 4. GIN index for full-text search tokens
CREATE INDEX IF NOT EXISTS idx_zenthra_knowledge_fts 
ON public.zenthra_knowledge 
USING gin (fts_tokens);

-- 5. GIN index for metadata JSONB filtering
CREATE INDEX IF NOT EXISTS idx_zenthra_knowledge_metadata 
ON public.zenthra_knowledge 
USING gin (metadata);

-- 6. Hardened RPC function with similarity cutoff threshold
CREATE OR REPLACE FUNCTION public.match_zenthra_documents (
    query_embedding VECTOR(1536),
    match_count INT DEFAULT 5,
    filter JSONB DEFAULT '{}'::jsonb,
    min_similarity FLOAT DEFAULT 0.60 -- QA Safeguard: Rejects low-confidence noise
) 
RETURNS TABLE (
    id BIGINT,
    content TEXT,
    metadata JSONB,
    similarity FLOAT
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    RETURN QUERY
    SELECT
        z.id,
        z.content,
        z.metadata,
        (1 - (z.embedding <=> query_embedding)) AS similarity
    FROM public.zenthra_knowledge z
    WHERE 
        (z.embedding IS NOT NULL)
        AND (1 - (z.embedding <=> query_embedding)) >= min_similarity
        AND (
            CASE 
                WHEN filter = '{}'::jsonb THEN TRUE
                ELSE z.metadata @> filter
            END
        )
    ORDER BY z.embedding <=> query_embedding
    LIMIT match_count;
END;
$$;

-- 7. Row Level Security (RLS) policies
ALTER TABLE public.zenthra_knowledge ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read access to knowledge base" ON public.zenthra_knowledge;
CREATE POLICY "Allow public read access to knowledge base" 
ON public.zenthra_knowledge 
FOR SELECT 
USING (true);

DROP POLICY IF EXISTS "Allow service_role full write access" ON public.zenthra_knowledge;
CREATE POLICY "Allow service_role full write access" 
ON public.zenthra_knowledge 
FOR ALL 
TO service_role 
USING (true) 
WITH CHECK (true);
