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


----------------------------------------------------------------------
Before starting the application in phpMyAdmin, create the database ominimo and execute the provided SQL script for this database. Then, start the application.

How to Start the Application:

1.Install dependencies:
composer install

2.Copy the .env file:
cp .env.example .env


3.Then set up the database connection:

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ominimo
DB_USERNAME=your_username    # Your phpMyAdmin credentials
DB_PASSWORD=your_password    # Your password

4.App key and debug mode:

APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true

5.Generate the app key:
php artisan key:generate

6.Install npm dependencies:
npm install

7-Compile assets:
npm run dev

8.Start the server in a second terminal:
php artisan serve
