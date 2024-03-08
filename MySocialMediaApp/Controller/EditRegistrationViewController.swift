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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Registration"
        customLabels()
        customButton()
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
    
    
    @IBAction func SaveChangesButtonTapped(_ sender: Any) {
    }
    
}
