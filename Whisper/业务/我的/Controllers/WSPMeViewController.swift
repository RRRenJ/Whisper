//
//  WSPMeViewController.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit

class WSPMeViewController: WSPBaseViewController {

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
extension WSPMeViewController {
    
}


//MARK: - method private
private extension  WSPMeViewController {
    
    func setupViews() {
        
    }
    
    func addConstraints(){
        
    }

    func addAction() {
        
    }
    
}
