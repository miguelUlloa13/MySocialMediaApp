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


        customNavigationBar()
        customLabels()
        customButtons()
        customTextFields()
        verifyCredentials()
    }
    

    // MARK: - Methods
    
    private func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.systemGreen  // customNavigation bar backgrouncolor
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = UIColor.link
    }
    
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
    
    
    /// Check if a session exists
    private func verifyCredentials() {
        
        if let (_, _) = KeychainHelper.recoverCredentials() {
            print("Successful login")
            // A session exists
            let usersVC = UsersViewController()
            self.navigationController?.pushViewController(usersVC, animated: false)
        } else {
            print("No credentials found")
        }

    }
    
    /// Action to perform after pressing Login button
    /// - Parameter sender: UIButton
    @IBAction private func LoginButtonTapped(_ sender: UIButton) {
        guard let username = UsernameTextField.text,
              let password = PasswordTextField.text else {
            return
        }

        
        if validateCredentials(username: username, password: password) {
            // Successful login
            print("Login exitoso")
            // Transition to UserViewcontroller and credentials are saved
            KeychainHelper.saveCredentials(username: username, password: password)
            let usersVC = UsersViewController()
            self.navigationController?.pushViewController(usersVC, animated: true)

        } else {
            // Login failed
            print("Login failed")
            UIAlertController.showAlert("Error", "Access error", from: self)
        }
    }
    
    
    /// Validate user credentials
    /// - Parameters:
    ///   - username: Usarname to validate
    ///   - password: Password to validate
    /// - Returns: True if the user credentials are correct
    private func validateCredentials(username: String, password: String) -> Bool {
        return username == "Administrador" && password == "Admin123"
    }

    
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

