//
//  LoginVC.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import UIKit
import SkyFloatingLabelTextField

class LoginVC: UIViewController {
    
    @IBOutlet weak var hideShowPasswordBu: UIButton!
    @IBOutlet weak var countryCodeBu: UIButton!
    @IBOutlet weak var countryCodeTableView: UITableView!
    @IBOutlet weak var loginLbl: LocalizableLabel!
    @IBOutlet weak var mainBu: LocalizableButton!
    @IBOutlet weak var loginBu: LocalizableButton!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneTxtField: SkyFloatingLabelTextField!
    
    var countryCodeBuTitle = ""
    var presenter: LoginPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        countryCodeTableView.delegate = self
        countryCodeTableView.dataSource = self
        countryCodeTableView.registerCell(cell: ISOIDCell.self)
        countryCodeBu.layer.cornerRadius = 5.0
        countryCodeBu.set(image: #imageLiteral(resourceName: "expand-arrow"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        countryCodeTableView.isHidden = true
        presenter.viewDidLoad()
    }
    
    func showCountryCodeTableView( _ sender : UIButton) {
        if countryCodeTableView.isHidden == true {
            countryCodeTableView.isHidden = false
        }else{
            countryCodeTableView.isHidden = true
        }
    }
    
    @IBAction func loginBuTapped(_ sender: UIButton) {
        presenter.didLogin()
    }
    
    @IBAction func countryCodeBuTapped(_ sender: UIButton) {
        showCountryCodeTableView(sender)
    }
}

extension LoginVC : LoginViewProtocol{
    
    func getPhoneTxt() -> String {
        return phoneTxtField.text ?? ""
    }
    
    func getPasswordTxt() -> String {
        return passwordTxtField.text ?? ""
    }
    
    func showLoadingIndicator() {
        print("showLoadingIndicator")
    }
    
    func hideLoadingIndicator() {
        print("hideLoadingIndicator")
    }
    
    func reloadData() {
        countryCodeTableView.reloadData()
        print("reloaded")
    }
    
}

extension LoginVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(presenter.numberOfRows)
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ISOIDCell" ,for : indexPath) as! ISOIDCell
        presenter.configure(cell: cell, indexPath: indexPath)
        print(cell.name.text ?? "")
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
}

extension LoginVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryCodeBuTitle = String( presenter.getSelectedIso(indexPath: indexPath).1)
        Helper.saveISOID(isoID: presenter.getSelectedIso(indexPath: indexPath).0)
        countryCodeBu.setTitle(countryCodeBuTitle, for: .normal)
        countryCodeTableView.isHidden = true
    }
}
