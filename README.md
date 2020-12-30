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
## API
	To use this api it´s not necesary authentification or authorization. Only have a method "get" about "answers" of forms.
	/*
	this base url depends of the name of the folder that contains the project.
	BASE_URL = http://localhost/autofactTest <=> http://localhost/autofactTest/index.php/api/answers
	*/
	-	endpoint: BASE_URL/index.php/api/answers
	-	type: GET
	-	data: {id[integer | length 11]} /* it´s not obligatory */
	-	response: json with all register of answers or only one, depends of id if it sent.
	-	example:
			when id = 1
			{"id":"1","question_number":"1","answer":"nada mas","forms_questions_id":"1","users_id":"1","created":"2020-12-30 01:04:42"}
			when id = empty
			[{"id":"1","question_number":"1","answer":"nada mas","forms_questions_id":"1","users_id":"1","created":"2020-12-30 01:04:42"},{"id":"2","question_number":"2","answer":"SI","forms_questions_id":"1","users_id":"1","created":"2020-12-30 01:04:42"},{"id":"3","question_number":"3","answer":"5","forms_questions_id":"1","users_id":"1","created":"2020-12-30 01:04:42"},{"id":"4","question_number":"1","answer":"quizás algo mas","forms_questions_id":"1","users_id":"2","created":"2020-12-30 01:28:56"},{"id":"5","question_number":"2","answer":"SI","forms_questions_id":"1","users_id":"2","created":"2020-12-30 01:28:56"},{"id":"6","question_number":"3","answer":"1","forms_questions_id":"1","users_id":"2","created":"2020-12-30 01:28:56"},{"id":"7","question_number":"1","answer":"fdsfsd","forms_questions_id":"1","users_id":"2","created":"2020-12-30 03:14:35"},{"id":"8","question_number":"2","answer":"Más o Menos","forms_questions_id":"1","users_id":"2","created":"2020-12-30 03:14:35"},{"id":"9","question_number":"3","answer":"2","forms_questions_id":"1","users_id":"2","created":"2020-12-30 03:14:35"}]
	
	To finish, the ideal escenary is use token. The token is obtained by way a user and password authentication & authorization to get token. The token is sent every time a request is made to the api & the api validates that it is current by way "exp" parameter in bd table session that contain, user_id, access_way (WEB || API), token, created & exp (expire) to validate that request is between created & expire time. But in this project no token implemented.

## Users example:
	1) email: admin@gmail.com, password: admin
	2) email: usuario1@gmail.com, password: usuario1

## To do:
	- Implements token security to WEB & API.
	