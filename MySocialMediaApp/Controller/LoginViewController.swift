//
//  LoginViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
        // Labels
    @IBOutlet weak var LogInToMySocialMediaLabelApp: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    
        // Button
    @IBOutlet weak var LogInButton: UIButton!
    
        // Text fields
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Log In"
        customLabels()
        customButtons()
        customTextFields()
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
        UsernameTextField.textColor = .label
        UsernameTextField.placeholder = "Username"
        UsernameTextField.font = UIFont(name: UIFont.nameOf.Futura_Medium.rawValue, size: 20)
        
        PasswordTextField.textColor = .label
        PasswordTextField.placeholder = "Password"
        PasswordTextField.font = UIFont(name: UIFont.nameOf.Futura_Medium.rawValue, size: 20)
    }
    
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        let usersVC = UsersViewController()
        self.navigationController?.pushViewController(usersVC, animated: true)
    }
    
}
