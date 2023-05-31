//
//  WSPManager.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import RRRTipsHUD

let mManager = WSPManager.default

class WSPManager: NSObject {
    //MARK: - property public
    static let `default` = WSPManager()
    
    var user : WSPUser?
    
    @WSPProperty<String>(key: "uuid", defaultValue: nil)
    var uuid
    
    
    
    private override init() {
        super.init()
        
    }
    
    
    //MARK: - property private

}

//MARK: - method public
extension WSPManager {
    

    
    func wsp_signIn(completion :@escaping (WSPUser?,WSPError?) -> Void){
        let req = WSPRequest(api: WSP_API_SignIn + (self.uuid ?? UIDevice.wsp_deviceUUID) , requestMethod: .get)
        WSPNetwork.default.request(req) { dic in
            let user = WSPUser.deserialize(from: dic)
            self.user = user
            completion(user,nil)
        } failure: { error in
            completion(nil,error)
        }
    }
    
    
    
}


//MARK: - method private
private extension  WSPManager {
    

    
}
