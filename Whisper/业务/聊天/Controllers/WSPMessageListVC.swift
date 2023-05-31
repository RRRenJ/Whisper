//
//  WSPMessageListVC.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import SendbirdUIKit

class WSPMessageListVC: SBUGroupChannelListViewController {
    //MARK: - property public
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wsp_setupViews()
        self.addAction()
        
    }
    
    
    //MARK: - property private

}

//MARK: - method public
extension WSPMessageListVC {
     func wsp_setupViews() {
        self.headerComponent?.leftBarButton? = UIBarButtonItem()
        
    }
    
    func addConstraints(){
        
    }

    func addAction() {
        
    }
}


//MARK: - method private
private extension  WSPMessageListVC {
  

    
}
