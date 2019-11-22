// It is a main file which include some functions and methods for working with HTML

// Подключение фреймворка express
const Express = require("express");
// Подключение фреймворка body-parser
const BodyParser = require("body-parser");
// Объявление номера прослушки порта сервера
const PORT = process.env.PORT || 8080;

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
	console.log(request.query["login"]);
	
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
	console.log(signInInfo);
	
	// отправка ответа на запрос (преобразование объекта в JSON и отправка на клиент)
	console.log(JSON.stringify(signInInfo));
	response.send(JSON.stringify(signInInfo));
});

// GEt запрос на регистрацию
Server.post("/SignUp", urlencodedParser, (request, response) => {
	
	// Сервер не отвечает
	if (!request.query) {
		return response.sendStatus(400);
	}
	
	if (!request.query) {
		response.send("Declined");
	} else {
		response.send("Your data was successfully saved!");
	}
});

// Выставление порта на прослушку
Server.listen(PORT);


// Вывод статуса сервера
console.log("Server is started...");