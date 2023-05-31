//
//  WSPNetwork.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit
import Moya
import Alamofire
import RxCocoa
import RxSwift
import HandyJSON

let WSPNetworkService = MoyaProvider<WSPRequest>()
let NWService = WSPNetwork.default



struct WSPRequest {
    var host : String?
    var api : String
    var requestMethod : Moya.Method
    var reCount : Int?
    var query : Dictionary<String,Any>?
    var bodyParameter : Dictionary<String,Any>?
    
}

extension WSPRequest : TargetType {
    var headers: [String : String]?{
        return ["APi-token" : WSP_SENDBIRD_TOKEN]
    }
    
    var baseURL: URL{
        if let base = self.host {
            return URL(string: base)!
        }else{
            return URL(string: WSP_SENDBIRD_HOST)!
        }
    }
    
    var method: Moya.Method{
        return self.requestMethod
    }
    
    var path: String{
        return self.api
    }
    
    var task: Task{
        if let para = self.bodyParameter{
            return .requestParameters(parameters: para, encoding: JSONEncoding.default)
        }
        return .requestPlain
    }
    
    var validationType: ValidationType{
        return .customCodes(Array(200..<500))
    }
    
}

struct WSPResponse : HandyJSON{
    var error : Bool = false
    var message : String?
    var code : Int = 0
}


class WSPNetwork: NSObject {
    //MARK: - property public
    static let `default` = WSPNetwork()
    private override init() {
        super.init()
        
    }
    
    private let disposeBag = DisposeBag()
    
    
    //MARK: - property private

}

//MARK: - method public
extension WSPNetwork {
    func request(_ request:WSPRequest, success : @escaping((Dictionary<String,Any>?) -> Void), failure: @escaping(WSPError) -> Void){
        if self.networkStatus == .notReachable {
            failure(WSPError(code: -999, message: "check network"))
            return
        }
        DispatchQueue.global().async {
            WSPNetworkService.rx.request(request, callbackQueue: DispatchQueue.main).asObservable().subscribe { response in
                let result = try? JSONSerialization.jsonObject(with: response.data, options: .allowFragments) as? Dictionary<String,Any>
                
                guard result != nil, let response = WSPResponse.deserialize(from: result!)  else{
                    failure(WSPError(code: -998, message: "dataFormatter error"))
                    return
                }
                if(response.error){
                    failure(WSPError(code: response.code, message: response.message ?? "error"))
                    return
                }
                success(result)
                
            } onError: { error in
                failure(WSPError(code: -1000, message: error.localizedDescription))
            }.disposed(by: self.disposeBag)
        }
    }
    
    var networkStatus: NetworkReachabilityManager.NetworkReachabilityStatus {
        return NetworkReachabilityManager.default?.status ?? .notReachable
    }
}


//MARK: - method private
private extension  WSPNetwork {
    
    func wps_networkStatusListening(){
        NetworkReachabilityManager.default?.startListening(onUpdatePerforming: { status in
            print("*****************Network*******************")
            print(status)
            print("*****************Network*******************")
        })
    }
    
}


struct WSPError : Error {
    var code : Int = 0
    var message : String = ""
}
