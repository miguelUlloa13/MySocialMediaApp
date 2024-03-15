//
//  Login2ViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 15/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
        // Labels
    @IBOutlet weak private var LogInToMySocialMediaLabelApp: UILabel!
    @IBOutlet weak private var UsernameLabel: UILabel!
    @IBOutlet weak private var PasswordLabel: UILabel!
    
        // Button
    @IBOutlet weak private var LogInButton: UIButton!
    
        // Text fields
    @IBOutlet weak private var UsernameTextField: UITextField!
    @IBOutlet weak private var PasswordTextField: UITextField!
    
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Log In"
        customLabels()
        customButtons()
        customTextFields()
        verifyCredentials()
    }
    
    // MARK: - Methods
    
    private func customLabels() {
        LogInToMySocialMediaLabelApp.text = "Log in to MySocialMediaApp"
        LogInToMySocialMediaLabelApp.myCustomFont(size: 25, textColor: .systemGreen)
        
        UsernameLabel.text = "Username"
        UsernameLabel.myCustomFont(textAlignment: .left)
        
        PasswordLabel.text = "Password"
        PasswordLabel.myCustomFont(textAlignment: .left)
        
    }
    
    private func customButtons() {
        LogInButton.backgroundColor = .systemGreen
        LogInButton.setTitle("Log in", for: .normal)
        LogInButton.setTitleColor(.white, for: .normal)
        LogInButton.titleLabel?.font = UIFont(name: UIFont.nameOf.Futura_Bold.rawValue, size: 25)
        LogInButton.round()
    }
    
    private func customTextFields() {
        
        UsernameTextField.delegate = self
        PasswordTextField.delegate = self
        
        UsernameTextField.textColor = .label
        UsernameTextField.placeholder = "Username"
        UsernameTextField.font = UIFont(name: UIFont.nameOf.Futura_Medium.rawValue, size: 20)
        
        PasswordTextField.textColor = .label
        PasswordTextField.placeholder = "Password"
        PasswordTextField.font = UIFont(name: UIFont.nameOf.Futura_Medium.rawValue, size: 20)
    }
    


    private func cleanTextFields() {
        UsernameTextField.text = ""
        PasswordTextField.text = ""
    }
    
    private func verifyCredentials() {
        // Verificar credenciales al iniciar sesión
        if let (_, _) = KeychainHelper.recuperarCredenciales() {
            print("Inicio de sesión exitoso")
            // Continuar con la lógica de la aplicación
            let usersVC = UsersViewController()
            self.navigationController?.pushViewController(usersVC, animated: false)
        } else {
            print("No se encontraron credenciales")
            // Mostrar un mensaje de error al usuario
        }

    }
    
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
        
        if (UsernameTextField.text == "Administrador") && (PasswordTextField.text == "Admin123") {
            
            KeychainHelper.guardarCredenciales(username: UsernameTextField.text!, password: PasswordTextField.text!)
            let usersVC = UsersViewController()
            cleanTextFields()
            self.navigationController?.pushViewController(usersVC, animated: true)
            
        } else {
            cleanTextFields()
            UIAlertController.showAlert("Error", "Log in", from: self)
        }
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

