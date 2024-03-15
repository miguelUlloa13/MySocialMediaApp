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
    
    @IBOutlet weak var HeaderView: HeaderView!
    
    
    // MARK: - Properties
    var userEdit: Users
    var indexPath: IndexPath
    weak var delegate: DataManagerDelegate?
    var validateString = ValidateString()
    
    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

    
    // MARK: - Constructor
    init(userEdit: Users, indexPath: IndexPath) {
        self.userEdit = userEdit
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Registration"
        self.HeaderView.navBar = self.navigationController!
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
        
        UserTitleTextField.text = userEdit.title
        UserTitleTextField.font = myFont
        UserTitleTextField.textAlignment = .center
        UserTitleTextField.keyboardType = .default
        
        UserFirstTextField.text = userEdit.first
        UserFirstTextField.font = myFont
        UserFirstTextField.textAlignment = .center
        UserFirstTextField.keyboardType = .default
        
        UserLastTextField.text = userEdit.last
        UserLastTextField.font = myFont
        UserLastTextField.textAlignment = .center
        UserLastTextField.keyboardType = .default

        CityTextField.text = userEdit.city
        CityTextField.font = myFont
        CityTextField.textAlignment = .center
        CityTextField.keyboardType = .default
        
        StateTextField.text = userEdit.state
        StateTextField.font = myFont
        StateTextField.textAlignment = .center
        StateTextField.keyboardType = .default
        
        CountryTextField.text = userEdit.country
        CountryTextField.font = myFont
        CountryTextField.textAlignment = .center
        CountryTextField.keyboardType = .default
        
        PostCodeTextField.text = userEdit.postcode.description
        PostCodeTextField.font = myFont
        PostCodeTextField.textAlignment = .center
        PostCodeTextField.keyboardType = .numbersAndPunctuation
        
        EmailTextField.text = userEdit.email
        EmailTextField.font = myFont
        EmailTextField.textAlignment = .center
        EmailTextField.keyboardType = .emailAddress
    }
    
    func validateTextField(_ textField: UITextField) -> Bool {
        guard let texto = textField.text, !texto.isEmpty else {
            // El campo de texto está vacío
            return false
        }
        // Puedes agregar más lógica de validación aquí según tus requisitos
    
        switch textField {
        case EmailTextField:
            if ValidateString().isValidEmail(EmailTextField.text!) {
                EmailTextField.backgroundColor = .green
                return true
            } else {
                EmailTextField.backgroundColor = .red
                UIAlertController.showAlert("Error", "The current field must be an email proper formatting.", from: self)
                return false
            }
            
        case PostCodeTextField:
            if ValidateString().containsOnlyNumbers(numberString: PostCodeTextField.text!) {
                PostCodeTextField.backgroundColor = .green
                return true
            } else {
                PostCodeTextField.backgroundColor = .red
                UIAlertController.showAlert("Error", "The current field must not contain spaces or letters, only numbers.", from: self)
                return false
            }
        default:
            if ValidateString().containsOnlyLetters(letterString: textField.text!) {
                textField.backgroundColor = .green
                return true
            } else {
                textField.backgroundColor = .red
                UIAlertController.showAlert("Error", "The current field must not contain spaces or numbers, only letters.", from: self)
                return false
            }
        }
    }


    
    
    @IBAction func SaveChangesButtonTapped(_ sender: UIButton) {
        
        if  validateTextField(UserTitleTextField) &&
            validateTextField(UserFirstTextField) &&
            validateTextField(UserLastTextField) &&
            validateTextField(CityTextField) &&
            validateTextField(StateTextField) &&
            validateTextField(CountryTextField) &&
            validateTextField(PostCodeTextField) &&
            validateTextField(EmailTextField) {
            
            // All fields are valid and saved
            print("All fields are valid")
            userEdit.email = EmailTextField.text!
            userEdit.postcode = Int64(PostCodeTextField.text!)!
            userEdit.title = UserTitleTextField.text
            userEdit.first = UserFirstTextField.text
            userEdit.last = UserLastTextField.text
            userEdit.city = CityTextField.text
            userEdit.state = StateTextField.text
            userEdit.country = CountryTextField.text
            
            
            delegate?.dataDidUpdate(indexPath: indexPath, userEdit: userEdit)
            self.navigationController?.popViewController(animated: true)
            
        } else {
            print("At least one of the fields is invalid")
        }
    }
}
    


// MARK: - UITextFieldDelegate
extension EditRegistrationViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


}

protocol DataManagerDelegate: AnyObject {
    func dataDidUpdate(indexPath: IndexPath, userEdit: Users)
}


