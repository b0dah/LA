struct UserModel: Decodable {
    var login: Login
    var password: Password
}

struct Login: Decodable {
    var description: String
    var value: String
}
struct Password: Decodable {
    var description: String
    var value: String
}

//class UserModel: Decodable {
//
//    init(<#parameters#>) {
//        <#statements#>
//    }
//
//
//
//}
//
//class Login: Decodable {
//       var description: String
//       var login: String
//
//    init(description: String, login: String) {
//        self.description = description
//        self.login = login
//    }
//}
//
//class Password: Decodable {
//    var description: String
//    var password: String
//
//    init(description: String, password: String) {
//        self.description = description
//        self.password = password
//    }
//}

//class UserModel: Codable {
//    var login: String
//    var password: String
//    var loginDescription: String
//    var passwordDescription: String
//
//    init(login: String, password: String, loginDescription: String,
//        passwordDescription: String) {
//        self.login = login
//        self.password = password
//
//        self.loginDescription = loginDescription
//        self.passwordDescription = passwordDescription
//    }
//}
