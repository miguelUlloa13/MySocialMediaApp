//
//  EditRegistrationViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

class EditRegistrationViewController: UIViewController {
    
    @IBOutlet weak var InstructionsLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var UserAddressLabel: UILabel!
    @IBOutlet weak var UserPostCodeLabel: UILabel!
    @IBOutlet weak var UserEmailLabel: UILabel!
    
    
    @IBOutlet weak var UserTitleTextField: UITextField!
    @IBOutlet weak var UserFirstTextField: UITextField!
    @IBOutlet weak var UserLastTextField: UITextField!
    
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var StateTextField: UITextField!
    @IBOutlet weak var CountryTextField: UITextField!
    
    @IBOutlet weak var PostCodeTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var SaveChangesButton: UIButton!
    
    // MARK: - Properties
    var userDataModel: UserDataModel
    var indexPath: IndexPath
    weak var delegate: DataManagerDelegate?
    var validateString = ValidateString()
    
    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

    
    // MARK: - Constructor
    init(userDataModel: UserDataModel, indexPath: IndexPath) {
        self.userDataModel = userDataModel
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Registration"
        customLabels()
        customButton()
        customTextFields()
    }
    
    private func customLabels() {
        InstructionsLabel.text = "Edit"
        InstructionsLabel.myCustomFont(size: 25, textColor: .label)
        
        UsernameLabel.text = "Username:"
        UsernameLabel.myCustomFont(size: 25, textColor: .label)
        
        UserAddressLabel.text = "Address:"
        UserAddressLabel.myCustomFont(size: 25, textColor: .label)
        
        UserPostCodeLabel.text = "Post code:"
        UserPostCodeLabel.myCustomFont(size: 25, textColor: .label)
        
        UserEmailLabel.text = "Email:"
        UserEmailLabel.myCustomFont(size: 25, textColor: .label)
    }
    
    private func customButton() {
        SaveChangesButton.backgroundColor = .systemGreen
        SaveChangesButton.setTitle("Save", for: .normal)
        SaveChangesButton.setTitleColor(.white, for: .normal)
        SaveChangesButton.titleLabel?.font = UIFont(name: UIFont.nameOf.Futura_Bold.rawValue, size: 20)
        SaveChangesButton.round()
    }
    
    private func customTextFields() {
        
        UserTitleTextField.delegate = self
        UserFirstTextField.delegate = self
        UserLastTextField.delegate = self
        CityTextField.delegate = self
        StateTextField.delegate = self
        CountryTextField.delegate = self
        PostCodeTextField.delegate = self
        EmailTextField.delegate = self
        
        let myFont = UIFont(name: "Futura", size: 15)
        
        UserTitleTextField.text = userDataModel.title
        UserTitleTextField.font = myFont
        UserTitleTextField.textAlignment = .center
        UserTitleTextField.keyboardType = .default
        
        UserFirstTextField.text = userDataModel.first
        UserFirstTextField.font = myFont
        UserFirstTextField.textAlignment = .center
        UserFirstTextField.keyboardType = .default
        
        UserLastTextField.text = userDataModel.last
        UserLastTextField.font = myFont
        UserLastTextField.textAlignment = .center
        UserLastTextField.keyboardType = .default

        CityTextField.text = userDataModel.city
        CityTextField.font = myFont
        CityTextField.textAlignment = .center
        CityTextField.keyboardType = .default
        
        StateTextField.text = userDataModel.state
        StateTextField.font = myFont
        StateTextField.textAlignment = .center
        StateTextField.keyboardType = .default
        
        CountryTextField.text = userDataModel.country
        CountryTextField.font = myFont
        CountryTextField.textAlignment = .center
        CountryTextField.keyboardType = .default
        
        PostCodeTextField.text = userDataModel.postcode?.description
        PostCodeTextField.font = myFont
        PostCodeTextField.textAlignment = .center
        PostCodeTextField.keyboardType = .numbersAndPunctuation
        
        EmailTextField.text = userDataModel.email
        EmailTextField.font = myFont
        EmailTextField.textAlignment = .center
        EmailTextField.keyboardType = .emailAddress
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    

    private func checkTextField(textField: UITextField) {
        
        switch textField {
            
        case EmailTextField:
            if !validateString.isValidEmail(EmailTextField.text!){
                EmailTextField.backgroundColor = .red
                showAlert(message: "The current field must be an email proper formatting.")
                EmailTextField.resignFirstResponder()
            } else {
                EmailTextField.backgroundColor = .green
                self.EmailTextField.resignFirstResponder()
                userDataModel.email = EmailTextField.text!
            }
            
        case PostCodeTextField:
            if !validateString.containsOnlyNumbers(numberString: PostCodeTextField.text!) {
                PostCodeTextField.backgroundColor = .red
                showAlert(message: "The current field must not contain spaces or letters, only numbers.")
                PostCodeTextField.resignFirstResponder()
            } else {
                PostCodeTextField.backgroundColor = .green
                self.PostCodeTextField.resignFirstResponder()
                userDataModel.postcode = Int(PostCodeTextField.text!)
            }
            
        default:
            if !validateString.containsOnlyLetters(letterString: textField.text!) {
                textField.backgroundColor = .red
                showAlert(message: "The current field must not contain spaces or numbers, only letters.")
                textField.resignFirstResponder()
            } else {
                textField.backgroundColor = .green
                textField.resignFirstResponder()
                userDataModel.title = UserTitleTextField.text
                userDataModel.first = UserFirstTextField.text
                userDataModel.last = UserLastTextField.text
                userDataModel.city = CityTextField.text
                userDataModel.state = StateTextField.text
                userDataModel.country = CountryTextField.text
                userDataModel.email = EmailTextField.text
            }
        }
    }
    
    
    @IBAction func SaveChangesButtonTapped(_ sender: UIButton) {
        
        if UserTitleTextField.backgroundColor != .red &&
            UserFirstTextField.backgroundColor != .red &&
            UserLastTextField.backgroundColor != .red &&
            CityTextField.backgroundColor != .red &&
            StateTextField.backgroundColor != .red &&
            CountryTextField.backgroundColor != .red &&
            EmailTextField.backgroundColor != .red &&
            PostCodeTextField.backgroundColor != .red {
            
            delegate?.dataDidUpdate(indexPath: indexPath, newData: userDataModel)
            dismiss(animated: true)
        }
        
        else {
            showAlert(message: "Some fields were not filled out correctly.")
        }
        
    }
    
}

// MARK: - UITextFieldDelegate
extension EditRegistrationViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkTextField(textField: textField)
        return true
    }

}

protocol DataManagerDelegate: AnyObject {
    func dataDidUpdate(indexPath: IndexPath, newData: UserDataModel)
}


