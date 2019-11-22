// It is a main file which include some functions and methods for working with HTML

// Подключение фреймворка express
const Express = require("express");
// Подключение фреймворка body-parser
const BodyParser = require("body-parser");
// Объявление номера прослушки порта сервера
const PORT = process.env.PORT || 8080;

const FileSystem = require("fs");
const Path = require('path');

// Создание экземпляра Express
const Server = Express();

// Создание экземпляра BodyParser
const urlencodedParser = BodyParser.urlencoded({
	extended: false
});



// GET запрос на вход в систему
Server.get("/SignIn", urlencodedParser, (request, response) => {

	// Сервер не отвечает
	if (!request.query) {
		return response.sendStatus(400);
	}
	
	// отладка (позыркать что пришло)
	//console.log(request);
//	console.log(request.query["login"]);
	
	// создание объекта
	let signInInfo = {
		login: {
			
			description: "Your login",
			value: request.query["login"]	
		},
		password: {
			description: "Your password",
			value: request.query["password"]

		}
	};
	
	// отладка (Позыркать сформированный объект)
//	console.log(signInInfo);
	
	// отправка ответа на запрос (преобразование объекта в JSON и отправка на клиент)
//	console.log(JSON.stringify(signInInfo));
	response.send(JSON.stringify(signInInfo));
});

// GEt запрос на регистрацию
Server.post("/SignUp", urlencodedParser, (request, response) => {
	
	// Сервер не отвечает
	if (!request.query) {
		return response.sendStatus(400);
	}
	
	let result = JSON.parse(request.);
	
	
	console.log(result.nickname);
	
	
	console.log(__dirname);
	console.log(request.query["nickname"]);
	console.log(request.query["name"]);
	console.log(request.query["surname"]);
	console.log(request.query["password"]);
	console.log(request.query["phone"]);
	let shrek = Path.join(__dirname, '/UsersRegistrationData/', `${request.query["nickname"]}.txt`);
	console.log(shrek);
	FileSystem.writeFileSync(shrek, request.query["nickname"]+"\n");
	FileSystem.appendFileSync(shrek, request.query["password"]+"\n");
	FileSystem.appendFileSync(shrek, request.query["name"]+"\n");
	FileSystem.appendFileSync(shrek, request.query["surname"]+"\n");
	FileSystem.appendFileSync(shrek, request.query["phone"]+"\n");
	response.send("Your data was successfully saved!");
});

// Выставление порта на прослушку
Server.listen(PORT);


// Вывод статуса сервера
console.log("Server is started...");