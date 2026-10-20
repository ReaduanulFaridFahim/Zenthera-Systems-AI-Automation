# 🏨 Hotel Management & Guest Reservation System

A full-stack hospitality reservation, room inventory, and guest billing web application engineered with PHP and MySQL.

## 🚀 Key Modules
- **Front-Desk Reservation Engine**: Room availability calendar, check-in/check-out workflows, and booking confirmation.
- **Room Inventory & Tiering**: Category management (Deluxe, Suite, Standard) with dynamic seasonal pricing.
- **Folio & Invoicing**: Automated billing itemization for room nights, amenities, and food & beverage service.
- **Administrative Analytics**: Daily occupancy rate reports, revenue summaries, and housekeeping status tracking.

## 🛠️ Technology Stack
- **Backend**: PHP (PDO / MySQLi)
- **Database**: MySQL Relational Database
- **Frontend**: HTML5, Vanilla CSS3, JavaScript (ES6), Bootstrap
- **Server**: Apache / Nginx (XAMPP / WAMP compatible)

## 📦 Local Setup
1. Clone the repository into your local server root (e.g. `htdocs/`):
   ```bash
   git clone https://github.com/ReaduanulFaridFahim/Hotel-Management-System-.git
   ```
2. Import `hotel.sql` into phpMyAdmin / MySQL.
3. Configure database credentials in `config.php`:
   ```php
   $host = "localhost";
   $user = "root";
   $password = "";
   $dbname = "hotel_db";
   ```
4. Access via browser at `http://localhost/Hotel-Management-System-/`.
