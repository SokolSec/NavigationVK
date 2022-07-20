

import Foundation


enum CheckError: Error {
    case emptyPassword
    case wrongPassword
}


final class Password {
    
    func check(password: String) throws -> Bool? {
        switch password {
        case "q":
            return true
        case "":
            throw CheckError.emptyPassword
        default:
            throw CheckError.wrongPassword
        }
    }
}
