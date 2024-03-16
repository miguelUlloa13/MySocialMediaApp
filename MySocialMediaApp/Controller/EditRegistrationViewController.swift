//
//  EditRegistrationViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

class EditRegistrationViewController: UIViewController {
    
    // MARK: - Outlets
        // Labels
    @IBOutlet weak private var InstructionsLabel: UILabel!
    @IBOutlet weak private var UsernameLabel: UILabel!
    @IBOutlet weak private var UserAddressLabel: UILabel!
    @IBOutlet weak private var UserPostCodeLabel: UILabel!
    @IBOutlet weak private var UserEmailLabel: UILabel!
    @IBOutlet weak var UserCounterLabel: UILabel!
    
    
        // Text fields
            // Name
    @IBOutlet weak private var UserTitleTextField: UITextField!
    @IBOutlet weak private var UserFirstTextField: UITextField!
    @IBOutlet weak private var UserLastTextField: UITextField!
    
            // Address
    @IBOutlet weak private var CityTextField: UITextField!
    @IBOutlet weak private var StateTextField: UITextField!
    @IBOutlet weak private var CountryTextField: UITextField!
    @IBOutlet weak private var PostCodeTextField: UITextField!
    
            // Email
    @IBOutlet weak private var EmailTextField: UITextField!
    
        // Buttons
    @IBOutlet weak private var SaveChangesButton: UIButton!
    
        // Viiews
    @IBOutlet weak private var HeaderView: HeaderView!
    
    
    // MARK: - Properties
    private var userEdit: Users             // Array to save updates
    private var indexPath: IndexPath        // Number of user
    weak var delegate: DataManagerDelegate? // Delegate
    private var validateString = ValidateString()   // Intance to validate Strings

    
    // MARK: - Constructor
    init(userEdit: Users, indexPath: IndexPath) {
        self.userEdit = userEdit
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Registration"
        self.HeaderView.navBar = self.navigationController!
        customLabels()
        customButton()
        customTextFields()
    }
    
    private func customLabels() {
        UserCounterLabel.text = "User: \(indexPath.row + 1)"
        UserCounterLabel.myCustomFont(size: 25, textColor: .label)
        
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
    
    /// Validate the text fields
    /// - Parameter textField: Textfield in view
    /// - Returns: True if the textfield passed all requirements
    private func validateTextField(_ textField: UITextField) -> Bool {
        guard let texto = textField.text, !texto.isEmpty else {
            // The text field is empty.
            return false
        }
        // validation logic
    
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


    
    
    /// Action to perform after pressing aveChanges button
    /// - Parameter sender: UIButton
    @IBAction private func SaveChangesButtonTapped(_ sender: UIButton) {
        
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

/// Protocol to update the cell
protocol DataManagerDelegate: AnyObject {
    func dataDidUpdate(indexPath: IndexPath, userEdit: Users)
}


