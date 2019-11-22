struct UserModel: Decodable {
    struct Login: Decodable {
        var description: String
        var value: String
    }
    struct Password: Decodable {
        var description: String
        var value: String
    }
    var login: Login
    var password: Password
}
