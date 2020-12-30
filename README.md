# AutFact Test
## Installation
- MariaDB: 10.4.14 
- PHP: 7.2.34
- Apache: 2.4.46 (Win64)
- CodeIgniter 3.X
- Up Apache services & MariaDB or MySQL service.
## Usage
	- Clone or download this project into a folder and set a name to the folder. After this, it´s necesary import "autofact.sql" to your database management.
	Once it´s ok! you need continue to configure parameters in the config files that are below.

## Configure:
	application->config->database.php
		'hostname' => 'localhost',
		'username' => 'root',
		'password' => '',
		'database' => 'autofact',
## Users example:
	1) email: admin@gmail.com, password: admin
	2) email: usuario1@gmail.com, password: usuario1