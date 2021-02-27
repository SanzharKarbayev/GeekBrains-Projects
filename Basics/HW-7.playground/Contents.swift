import Cocoa

enum Errors: Error {
    case wrongLogin
    case wrongPassword
}

class User {
    var login: String
    var password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
    func changeUserLogin(newLogin: String, oldLogin: String) throws {
        guard oldLogin == login else {
            throw Errors.wrongLogin
        }
        login = newLogin
    }
    
    func changeUserPassword(newPassword: String, oldPassword: String) throws {
        guard oldPassword == password else {
            throw Errors.wrongPassword
        }
        password = newPassword
    }
}

var user = User(login: "Sanzhar", password: "sanzhar")
print("user's login: ", user.login)
print("user's password: ", user.password)
do {
    try user.changeUserLogin(newLogin: "SANZHAR", oldLogin: "Sanzhar")
    try user.changeUserPassword(newPassword: "jfjfjjf", oldPassword: "jsjjs")
} catch Errors.wrongLogin{
    print("Не правильный логин")
} catch Errors.wrongPassword {
    print("Не правильный пароль")
}
print("user's login: ", user.login)
print("user's password: ", user.password)

do {
    try user.changeUserLogin(newLogin: "Sanzhar", oldLogin: "SANZHAR")
    try user.changeUserPassword(newPassword: "jfjfjjf", oldPassword: "sanzhar")
} catch Errors.wrongLogin{
    print("Не правильный логин")
} catch Errors.wrongPassword {
    print("Не правильный пароль")
}
print("user's login: ", user.login)
print("user's password: ", user.password)
