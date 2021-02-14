//
//  LoginRouter.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    func handleLoginBu() {
        let vc = MainVC(nibName: "MainVC", bundle: nil)
        viewController?.navigationController?.pushViewController(vc, animated: true)
        print("Logined")
    }

    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = LoginVC(nibName: "LoginVC", bundle: nil)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view  , interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
