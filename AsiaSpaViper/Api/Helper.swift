
//
import UIKit
import SwiftKeychainWrapper

// MARK:- saveID
class Helper {
    
//    class func restartApp(completion : (() -> Void)? = nil){
//        var vc : UIViewController?
//        guard let window = UIApplication.shared.keyWindow else {return}
//
//        if getApiID() == nil {
//            // goto Auth Screen
//            vc = LoginVC(nibName: "LoginVC", bundle: nil)
//        }
//        else{
//            // goto Main Screen
//            vc = MainVC(nibName: "MainVC", bundle: nil)
//        }
//        window.rootViewController = vc
////        UIView.transition(with: window, duration: 0.5, options: ., animations: nil, completion: nil)
//    }
  
    class func saveID(id : Int){
        KeychainWrapper.standard.set(id,forKey: "user_id")
        print("IDFROMSAVEID : \(id)")

    }
    
    // MARK:- removeID
    class func removeID(id : Int){
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "user_id")
        KeychainWrapper.standard.removeObject(forKey: "user_id")
        print("IDremove : \(id)")
//        self.restartApp()
    }
    
    class func getApiID() -> Int? {
        return KeychainWrapper.standard.integer(forKey: "user_id")
    }
    
    //MARK:- Iso ID
    class func saveISOID(isoID :Int){
        KeychainWrapper.standard.set(isoID,forKey: "iso_id")
        print("IDFROMSAVEID : \(isoID)")
    }
    class func getISOID() -> Int? {
        return KeychainWrapper.standard.integer(forKey: "iso_id")
    }
    
}
