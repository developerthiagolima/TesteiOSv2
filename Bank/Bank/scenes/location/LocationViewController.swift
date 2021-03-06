//
//  LocationViewController.swift
//  Bank
//
//  Created by Thiago Lima on 19/01/19.
//  Copyright (c) 2019 SantanderTecnologia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LocationDisplayLogic: class{
    func validateLogin() -> Bool
    func validLogin(_ userAccount: Location.UserAccount)
    func displayError(_ error: Location.Error)
}

class LocationViewController: UIViewController, LocationDisplayLogic{
    var interactor: LocationBusinessLogic?
    var router: (NSObjectProtocol & LocationRoutingLogic & LocationDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup(){
        let viewController = self
        let interactor = LocationInteractor()
        let presenter = LocationPresenter()
        let router = LocationRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBOutlet var tf_user: UITextField!
    @IBOutlet var tf_pass: UITextField!
    
    func validLogin(_ userAccount: Location.UserAccount){
        self.dismissHUD(isAnimated: true)
        self.tf_pass.text = ""
        self.performSegue(withIdentifier: "Currency", sender: nil)
    }
    
    func displayError(_ error: Location.Error){
        self.dismissHUD(isAnimated: true)
        self.showAlert(title: "Bank", message: error.message)
    }
    
    func validateLogin() -> Bool{
        let user = self.tf_user.text!
        if user.isNumeric && !user.isValidCPF() {
            self.showAlert(title: "Bank", message: "Usuário informado é inválido.")
            return false
            
        } else if !user.isValidEmail() {
            self.showAlert(title: "Bank", message: "Usuário informado é inválido.")
            return false
            
        }
        
        let pass = self.tf_pass.text!
        if !pass.isValidPassword() {
            self.showAlert(title: "Bank", message: "Senha informada é inválida.")
            return false
        }
        
        return true
    }
    
    @IBAction func LoginAction(_ sender: UIButton) {
        if validateLogin() {
            self.showHUD(progressLabel: "")
            let request = Location.Login.Request(user: self.tf_user.text!, password: self.tf_pass.text!)
            interactor?.login(request)
        }
    }
    
}

extension LocationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == self.tf_user {
            self.tf_pass.becomeFirstResponder()
        }
        return true
    }
}
