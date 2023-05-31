//
//  WSPBaseViewController.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit

class WSPBaseViewController: UIViewController {

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
extension WSPBaseViewController {
    
}


//MARK: - method private
private extension  WSPBaseViewController {
    
    func setupViews() {
        
    }
    
    func addConstraints(){
        
    }

    func addAction() {
        
    }
    
}
