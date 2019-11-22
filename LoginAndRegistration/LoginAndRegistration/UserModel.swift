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
