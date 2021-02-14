//
//  LoginProtocol.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import Foundation

protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol! { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
    func getPhoneTxt()-> String
    func getPasswordTxt()-> String
}

protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol? { get set }
    var numberOfRows: Int { get }
    func viewDidLoad()
    func didLogin()
    func configure(cell: IsoCellView, indexPath: IndexPath)
    func getSelectedIso(indexPath: IndexPath) -> (Int , String)
    func configureLogin(viewModel : LoginViewModel)
}

protocol LoginRouterProtocol {
    func handleLoginBu()
}

protocol LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol? { get set }
    func getIsoData()
    func getLoginData(phone : String , password : String )
    //completion : @escaping (ISOIDModel?,ConfirmPhoneError? ,Error?)->()
}

protocol LoginInteractorOutputProtocol: class {
    func isoFetchedSuccessfully(isos: [ISOIDData])
    func loginFetchedSuccessfully(loginData: LoginData?)
    func isoFetchingFailed(withError error: ConfirmPhoneError)
    func isoFailed(withError error: Error?)
}

protocol IsoCellView {
    func configure(viewModel: IsoViewModel)
}
