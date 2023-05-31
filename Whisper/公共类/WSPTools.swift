//
//  WSPTools.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import SAMKeychain

class WSP_Tools: NSObject {
    //MARK: - property public
    
    
    
    //MARK: - property private

}

//MARK: - method public
extension WSP_Tools {
    
}


//MARK: - method private
private extension  WSP_Tools {
    

    
}


extension Bundle {
    static var wsp_bundleId : String {
        if let info = self.main.infoDictionary {
            return info["CFBundleIdentifier"] as! String
        }
        return ""
    }
}


extension UIDevice{
    static var wsp_deviceUUID:String {
        let bundleID = Bundle.wsp_bundleId
        let uuid = SAMKeychain.password(forService: WSP_APP_SERVICE, account: bundleID)
        if let id = uuid {
            return id
        }
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        guard let strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef) else {
            return UUID().uuidString.uppercased()
        }
        let uuidString = strRef as String
        let upperUUID = uuidString.lowercased()
        SAMKeychain.setAccessibilityType(kSecAttrAccessibleAfterFirstUnlock)
        SAMKeychain.setPassword(upperUUID, forService: WSP_APP_SERVICE, account: bundleID)
        return upperUUID
    }
}

public extension UIColor {

    static func wps_hex(_ hexCode:String, _ alpha : CGFloat? = nil) -> UIColor {
       var cleanCode = hexCode.replacingOccurrences(of:"#", with:"")
        if cleanCode.count == 3 {
            let str1 = String(cleanCode.first!)
            let str2 = String(cleanCode.dropFirst().dropLast())
            let str3 = String(cleanCode.last!)
        
            cleanCode = str1 + str1 + str2 + str2 + str3 + str3
        }
        if cleanCode.count == 6 {
            cleanCode = cleanCode + "ff"
        }
        
        var baseValue : CUnsignedInt = 0
        Scanner(string: cleanCode).scanHexInt32(&baseValue)
        
        let red = CGFloat(baseValue >> 24 & 0xFF) / CGFloat(255.0)
        let green = CGFloat(baseValue >> 16 & 0xFF) / CGFloat(255.0)
        let blue = CGFloat(baseValue >> 8 & 0xFF) / CGFloat(255.0)
        let aalpha = CGFloat(baseValue >> 0 & 0xFF) / CGFloat(255.0)
        if alpha != nil {
            return UIColor(red: red, green: green, blue: blue, alpha: alpha!)
        }else{
            return UIColor(red: red, green: green, blue: blue, alpha: aalpha)
        }
    }
}



@propertyWrapper
struct WSPProperty<T>{
    let key : String
    let defaultValue : T?
    var wrappedValue : T? {
        get{
            let user = UserDefaults.standard
            guard let value = user.value(forKey: key) else {
                return defaultValue
            }
            return value as? T
        }
        set{
            let user = UserDefaults.standard
            user.set(newValue, forKey: key)
            user.synchronize()
        }
    }
}



extension UIButton {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.layer.removeAllAnimations()
        let theAnimations = CABasicAnimation(keyPath: "transform.scale");
        theAnimations.duration = 0.2
        theAnimations.isRemovedOnCompletion = false
        theAnimations.fillMode = .forwards
        theAnimations.fromValue = 1.0
        theAnimations.toValue = 0.9
        self.layer.add(theAnimations, forKey: "animateTransform")
        super.touchesBegan(touches, with: event)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.layer.removeAllAnimations()
        let theAnimations = CABasicAnimation(keyPath: "transform.scale");
        theAnimations.duration = 0.2
        theAnimations.isRemovedOnCompletion = false
        theAnimations.fillMode = .forwards
        theAnimations.fromValue = 0.9
        theAnimations.toValue = 1.0
        self.layer.add(theAnimations, forKey: "animateTransform")
        super.touchesEnded(touches, with: event)
    }
    
}

extension UIViewController {
    static func wsp_initWithStoryBoard(_ storyBoardName : String) -> UIViewController {
        let storeBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        let vc = storeBoard.instantiateViewController(withIdentifier: self.sbu_className)
        return vc
    }
}


extension UIFont {
    static func wsp_size(_ size :CGFloat) -> UIFont {
        let font = UIFont(name: "Impact", size: size)
        return font!
    }
}


