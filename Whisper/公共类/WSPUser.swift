//
//  WPSUser.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import HandyJSON

struct WSPUser : HandyJSON {
    //MARK: - property public
    var user_id : String?

    var nickname : String?

    var profile_url : String?
   
    var access_token : String?
  
    var is_online = false
   
    var is_active = false
  
    var is_created = false
 
    var session_tokens = Array<String>()
    
    //MARK: - property private

}

//MARK: - method public
extension WSPUser {
    
}


//MARK: - method private
private extension  WSPUser {
    

    
}
