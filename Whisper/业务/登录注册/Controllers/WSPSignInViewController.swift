//
//  WSPSignInViewController.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import RxCocoa
import RxSwift
import RRRTipsHUD

class WSPSignInViewController: WSPBaseViewController {

    @IBOutlet weak var signInBt: UIButton!
    @IBOutlet weak var signUpBt: UIButton!
    //MARK: - property public
    
    
    //MARK: - property private
    private let disposeBag = DisposeBag()
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
extension WSPSignInViewController {
    
}


//MARK: - method private
private extension  WSPSignInViewController {
    
    func setupViews() {
        
    }
    
    func addConstraints(){
        
    }

    func addAction() {
        self.signInBt.rx.tap.subscribe {  event  in
            RRRTipsHUD.showLoading()
            mManager.wsp_signIn { user, error in
                if(error != nil){
                    RRRTipsHUD.show(error?.message ?? "")
                }else{
                    RRRTipsHUD.showSuccess("Sign in successfully")
                }
            }
        }.disposed(by: self.disposeBag)
        
        
        self.signUpBt.rx.tap.subscribe { [weak self] event in
            let vc = WSPSignUpViewController.wsp_initWithStoryBoard("Login")
            self?.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: self.disposeBag)
        
    }
    
}
