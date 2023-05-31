//
//  WSPSDKManager.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import SendbirdUIKit

class WSPSDKManager: NSObject {
    //MARK: - property public
    
    func wsp_loadSDK() {
        SendbirdUI.initialize(applicationId: WSP_SENDBIRD_APPID) { error in
            
        }
    }
    
    
    
    
    //MARK: - property private

}

//MARK: - method public
extension WSPSDKManager {
    
}


//MARK: - method private
private extension  WSPSDKManager {
    

    
}
