//
//  WSPMainViewController.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit

class WSPMainViewController: UITabBarController {

    //MARK: - property public
    
    
    
    //MARK: - property private
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addAction()
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.addConstraints()
    }
  
}
    
//MARK: - method public
extension WSPMainViewController {
    
}


//MARK: - method private
private extension  WSPMainViewController {
    
    func setupViews() {
        self.tabBar.isTranslucent = false;
        self.tabBar.barStyle =  .black;
        
        let messageNavi = WSPBaseNavigationVC(rootViewController: WSPMessageListVC())
        let messageItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "wps_chat_unselect"), selectedImage: #imageLiteral(resourceName: "wps_chat_select"))
        messageNavi.tabBarItem = messageItem;
        
        let meNavi = WSPBaseNavigationVC(rootViewController: WSPMeViewController())
        let meItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "wps_me_unselect"), selectedImage: #imageLiteral(resourceName: "wps_me_select"))
        meNavi.tabBarItem = meItem;
        
        self.addChild(messageNavi)
        self.addChild(meNavi)
        
    }
    
    func addConstraints(){
        
    }

    func addAction() {
        
    }
    
}
