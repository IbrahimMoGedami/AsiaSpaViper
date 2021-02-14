//
//  LoginPresenter.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    private let interactor: LoginInteractorInputProtocol
    private let router: LoginRouterProtocol
    private var isos = [ISOIDData]()
    
    init(view: LoginViewProtocol, interactor: LoginInteractorInputProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter : LoginPresenterProtocol{
    func didLogin() {
        guard let phone = view?.getPhoneTxt() , let password = view?.getPasswordTxt() else { return }
        interactor.getLoginData(phone: phone, password: password)
    }
    
    func configureLogin(viewModel: LoginViewModel) {
        
    }
    
    
    func getSelectedIso(indexPath: IndexPath) -> (Int, String) {
        return (isos[indexPath.row].id, isos[indexPath.row].name)
    }
    
    var numberOfRows: Int {
        print("count of iso : \(isos.count)")
        return isos.count
        
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getIsoData()
    }
    
    func configure(cell: IsoCellView, indexPath: IndexPath) {
        let iso = isos[indexPath.row]
        let viewModel = IsoViewModel(iso: iso)
        cell.configure(viewModel: viewModel)
        print("viewModel.name : \(viewModel.name)")
    }
}

extension LoginPresenter : LoginInteractorOutputProtocol{
    func loginFetchedSuccessfully(loginData: LoginData?) {
        guard let userID = loginData?.id else { return }
        Helper.saveID(id: userID)
        print("user id :\(userID)")
        router.handleLoginBu()
    }
    
    func isoFetchedSuccessfully(isos: [ISOIDData]) {
        view?.hideLoadingIndicator()
        self.isos.append(contentsOf: isos)
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
    
    func isoFetchingFailed(withError error: ConfirmPhoneError) {
        print(error.msg ?? "")
        view?.hideLoadingIndicator()
    }
    
    func isoFailed(withError error: Error?) {
        print(error?.localizedDescription ?? "")
        view?.hideLoadingIndicator()
    }
}
