

import UIKit

protocol UserService {
    func userService(userName: String) -> User?
}

final class User {
    let fullName: String
    var avatar: String
    var status: String
    
    init(fullName: String, avatar: String, status: String) {
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
