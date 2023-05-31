//
//  WSPSDKManager.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import SendbirdUIKit
import SendbirdChatSDK
import IQKeyboardManagerSwift

class WSPSDKManager: NSObject {
    //MARK: - property public
    
    static func wsp_loadSDK() {
        SendbirdUI.initialize(applicationId: WSP_SENDBIRD_APPID) { error in
            
        }
        SendbirdChatSDK.InitParams(applicationId: WSP_SENDBIRD_APPID)
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
//        SBUModuleSet.groupChannelListModule.headerComponent?.leftBarButton? = UIBarButtonItem()
        
    }
    
    
    
    
    //MARK: - property private

}

//MARK: - method public
extension WSPSDKManager {
    
}


//MARK: - method private
private extension  WSPSDKManager {
    

    
}
