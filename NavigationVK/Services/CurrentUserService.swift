

import UIKit

final class CurrentUserService: UserService {
    private let user: User
    
    init() {
        user = User(fullName: "admin", avatar: "avatar", status: "logined")
    }
    
    func userService(userName: String) -> User? {
        userName == user.fullName ? user: nil
    }
}
