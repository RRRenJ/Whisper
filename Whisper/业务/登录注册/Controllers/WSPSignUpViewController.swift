//
//  WSPSignUpViewController.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import RxCocoa
import RxSwift
import RRRTipsHUD

class WSPSignUpViewController: WSPBaseViewController {
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var startBt: UIButton!
    @IBOutlet weak var backBt: UIButton!
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
extension WSPSignUpViewController {
    
}


//MARK: - method private
private extension  WSPSignUpViewController {
    
    func setupViews() {
        self.nicknameTF.attributedPlaceholder = NSAttributedString(string: "NICKNAME", attributes: [.font:UIFont.wsp_size(18),.foregroundColor:UIColor.wps_hex("ffffff",0.5)])
        self.codeTF.attributedPlaceholder = NSAttributedString(string: "CODE", attributes: [.font:UIFont.wsp_size(18),.foregroundColor:UIColor.wps_hex("ffffff",0.5)])
    }
    
    func addConstraints(){
        
    }

    func addAction() {
        self.startBt.rx.tap.subscribe { [weak self] event in
            if let weakSelf = self {
                if let code = weakSelf.codeTF.text, let nickname = weakSelf.nicknameTF.text  {
                    let nickname1 = nickname.replacingOccurrences(of: " ", with: "")
                    if(nickname1.count == 0){
                        RRRTipsHUD.showError("nickname is Empty")
                        return
                    }
                    let code1 = code.replacingOccurrences(of: " ", with: "")
                    if(code1.count == 0){
                        RRRTipsHUD.showError("code is Empty")
                        return
                    }
                    var req = WSPRequest(api: WSP_API_SignUp, requestMethod: .post)
                    req.bodyParameter = ["user_id":UIDevice.wsp_deviceUUID,
                                         "nickname":nickname,
                                         "profile_url":"https://sendbird.com/main/img/profiles/profile_05_512px.png",
                                         "issue_access_token":true,
                                        ]
                    RRRTipsHUD.showLoading()
                    WSPNetwork.default.request(req) { data in
                        RRRTipsHUD.hideHUD()
                        let user = WSPUser.deserialize(from: data)
                        mManager.user = user
                        mManager.uuid = UIDevice.wsp_deviceUUID;
                        UIApplication.shared.keyWindow?.rootViewController = WSPMainViewController()
                        
                    } failure: { error in
                        RRRTipsHUD.showError(error.message)
                    }
                    
                }else{
                    RRRTipsHUD.showError("it‘s Empty")
                }
                
                
                
            }
        }.disposed(by: self.disposeBag)
        
        self.backBt.rx.tap.subscribe { [weak self] event in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: self.disposeBag)
        
    }
    
}

