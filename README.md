# Event Management System

Aplikasi manajemen event modern yang dibangun dengan Laravel, memungkinkan pengguna untuk membuat, mengelola, dan mendaftar ke berbagai event.

## Fitur Utama

### 1. **Manajemen Event**
- Buat event dengan detail lengkap (judul, deskripsi, lokasi, tanggal, kapasitas)
- Upload gambar cover event
- Kategorisasi event (Conference, Workshop, Seminar, Concert, Sports, etc.)
- Edit dan hapus event
- Status event (Upcoming, Ongoing, Completed, Cancelled)

### 2. **Sistem Registrasi**
- Pendaftaran peserta dengan validasi
- Konfirmasi email otomatis
- Generate tiket digital dengan QR Code
- Pembatasan kapasitas peserta
- Daftar waiting list untuk event penuh

### 3. **Dashboard Interaktif**
- Dashboard admin dengan statistik real-time
- Dashboard user untuk event yang diikuti
- Analytics event (jumlah peserta, tingkat kehadiran)
- Grafik visualisasi data

### 4. **Sistem Autentikasi**
- Login & Register dengan validasi
- Role-based access control (Admin & User)
- Password recovery
- Profile management

### 5. **Fitur Pencarian & Filter**
- Pencarian event berdasarkan keyword
- Filter berdasarkan kategori
- Filter berdasarkan tanggal
- Filter berdasarkan lokasi
- Sorting (newest, oldest, popular)

### 6. **Notifikasi**
- Email notification untuk registrasi event
- Reminder event H-1
- Update status event

### 7. **QR Code System**
- Generate QR Code untuk setiap tiket
- Scan QR Code untuk check-in peserta
- Validasi tiket

## Tech Stack

- **Backend**: Laravel 10.x
- **Frontend**: Blade Templates, Tailwind CSS
- **Database**: MySQL
- **Authentication**: Laravel Breeze / Sanctum
- **Additional Libraries**:
  - SimpleSoftwareIO/simple-qrcode (QR Code generation)
  - Intervention/image (Image processing)
  - Laravel Charts (Data visualization)

## Instalasi

### Prerequisites
- PHP >= 8.1
- Composer
- MySQL
- Node.js & NPM

### Langkah Instalasi

1. **Clone repository**
```bash
git clone https://github.com/yourusername/event-management-system.git
cd event-management-system
```

2. **Install dependencies**
```bash
composer install
npm install
```

3. **Setup environment**
```bash
cp .env.example .env
php artisan key:generate
```

4. **Konfigurasi database**
Edit file `.env`:
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=event_management
DB_USERNAME=root
DB_PASSWORD=
```

5. **Migrasi database**
```bash
php artisan migrate --seed
```

6. **Setup storage**
```bash
php artisan storage:link
```

7. **Compile assets**
```bash
npm run dev
```

8. **Jalankan aplikasi**
```bash
php artisan serve
```

Akses aplikasi di `http://localhost:8000`

## Akun Demo

**Admin:**
- Email: admin@eventmanager.com
- Password: admin123

**User:**
- Email: user@example.com
- Password: user123

## Struktur Database

### Tabel Events
- id, title, slug, description, category
- location, venue_address
- start_date, end_date
- capacity, registered_count
- price, is_free
- status (upcoming, ongoing, completed, cancelled)
- image, created_by, timestamps

### Tabel Registrations
- id, event_id, user_id
- ticket_number (unique)
- qr_code
- status (pending, confirmed, cancelled)
- checked_in_at
- timestamps

### Tabel Users
- Laravel default + role field

## API Endpoints

```
GET    /api/events              - List semua event
GET    /api/events/{id}         - Detail event
POST   /api/events              - Buat event baru (Admin)
PUT    /api/events/{id}         - Update event (Admin)
DELETE /api/events/{id}         - Hapus event (Admin)
POST   /api/events/{id}/register - Daftar event
GET    /api/my-events           - Event yang diikuti user
```

## Screenshots

### Homepage
Landing page dengan list event terbaru dan populer

### Event Detail
Halaman detail event dengan informasi lengkap dan tombol registrasi

### Dashboard Admin
Dashboard dengan statistik dan management event

### My Events
Daftar event yang diikuti user dengan tiket QR Code

## Fitur yang Menonjol untuk Portfolio

1. **Clean Architecture**: Menggunakan Repository Pattern dan Service Layer
2. **RESTful API**: API endpoints yang terstruktur dengan baik
3. **Security**: CSRF protection, XSS prevention, SQL injection protection
4. **Responsive Design**: Mobile-first design dengan Tailwind CSS
5. **Image Upload & Processing**: Dengan validasi dan optimization
6. **QR Code Generation**: Implementasi QR Code untuk ticketing system
7. **Email Integration**: Automated email notifications
8. **Data Visualization**: Charts dan graphs untuk analytics
9. **Search & Filter**: Advanced search functionality
10. **Role-based Access Control**: Multi-level authentication

## Testing

```bash
# Run all tests
php artisan test

# Run specific test
php artisan test --filter EventTest
```

## Deployment

Aplikasi ini siap di-deploy ke:
- Heroku
- DigitalOcean
- AWS
- Vercel (dengan Laravel Vapor)

## Kontribusi

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## Kontak

Nama Anda - [email@example.com](mailto:email@example.com)

Project Link: [https://github.com/yourusername/event-management-system](https://github.com/yourusername/event-management-system)

Live Demo: [https://your-demo-url.com](https://your-demo-url.com)
