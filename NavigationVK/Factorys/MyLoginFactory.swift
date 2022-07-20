

final class MyLoginFactory: LoginFactory {
    func makeLoginFactory() -> LoginInspector {
        return LoginInspector()
    }
}
