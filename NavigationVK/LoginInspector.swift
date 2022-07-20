

final class LoginInspector: LoginViewControllerDelegate {
    func checkerLoginInspector(login: String, password: String) -> Bool {
        Checker.shared.checkAutentifical(login: login, password: password)
    }
}
