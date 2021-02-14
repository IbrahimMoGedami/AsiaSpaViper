//
//  LoginInteractor.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import Foundation
import Alamofire

class LoginInteractor: LoginInteractorInputProtocol {
    
    
    weak var presenter: LoginInteractorOutputProtocol?
    
    func getIsoData() {
        guard let url = URL(string: URLs.isoURL )else {
        print("error in isoURL")
        return
        }
        APIServices.instance.getData(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headers: nil) { [weak self](response : ISOIDModel?, responseError : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            if let response = response{
                let isoId = response.data
                
                self.presenter?.isoFetchedSuccessfully(isos: isoId)
            }else if let responseError = responseError{
                self.presenter?.isoFetchingFailed(withError: responseError)
            }else{
                self.presenter?.isoFailed(withError: error)
            }
        }
    }
    
    func getLoginData(phone : String , password : String){
        
        guard let url = URL(string: URLs.loginURL) else { return }
        let lang = Language.currentLanguage()
        let deviceType = "ios"
        let deviceId = "qwekjqwekanxckippawqyqwrytfhgfytafdasfdzcnjtaswq"
        guard let isoID = Helper.getISOID() else {
            print("isoID not found")
            return}
        
        let paramters = ["phone" : phone , "password" : password,"lang" : lang ,"device_id" : deviceId , "device_type" : deviceType , "iso_id" : isoID ] as [String : Any]
        
        APIServices.instance.getData(url: url, method: .post, params: paramters, encoding: JSONEncoding.default, headers: nil) { [weak self](response : Login?, responseError : ConfirmPhoneError?, error) in
            guard let self = self else {return}
            if let response = response{
                let data = response.data
                
                self.presenter?.loginFetchedSuccessfully(loginData: data)
            }else if let responseError = responseError{
                self.presenter?.isoFetchingFailed(withError: responseError)
            }else{
                self.presenter?.isoFailed(withError: error)
            }
        }
    }
    
}
