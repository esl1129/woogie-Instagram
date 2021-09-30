
import FirebaseAuth

public class AuthManager{
    static let shared = AuthManager()

    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        /*
         - Check if username is available
         - Check if email is available
         - Create account
         - Insert account to DB
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username){ canCreate in
            if canCreate{
                /*
                 - Create Account
                 - Insert Account to DB
                 */
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    // Firebase auth could not create account
                    guard error == nil && result != nil else{
                        completion(false)
                        return
                    }
                    
                    // Insert into DB
                    DatabaseManager.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                        
                    }
                }
            }else{
                // either username or email does not exist
                completion(false)
            }
            
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        if let email = email {
            // email Login
            Auth.auth().signIn(withEmail: email,password: password) { authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
            }
        }else if let username = username{
            // username Login
            print(username)
        }
    }
}
