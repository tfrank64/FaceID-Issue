import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(authenticationWithTouchID))
        self.view.addGestureRecognizer(gesture)
    }
}

extension ViewController {
    
    @objc func authenticationWithTouchID() {
        
        let localAuthenticationContext = LAContext()
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To access secure data") { success, evaluateError in
                
                if false {
                    print("Success")
                } else {
                    print("Error")
                    let context = LAContext()
                    let status = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
                    print("Status: \(status)")
                }
            }
        }
    }
}
