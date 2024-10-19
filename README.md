Pre startovanja aplikacije u phpMyAdminu doadajte bazu ominimo i sql skriptu pokrenite za tu bazu
Zatim startujte aplikaciju
Kako startovati aplikaciju
1. composer install

2. cp .env.example .env

3. onda podesite konekciju sa bazom

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ominimo
DB_USERNAME=korisnicko_ime //Vasi kredencijali za phpmyadmin
DB_PASSWORD=lozinka


4. app kljuc i debug mode

APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true

5. php artisan key:generate

6. npm install

7. npm run dev 

8.php artisan serve
u drugom terminalu
