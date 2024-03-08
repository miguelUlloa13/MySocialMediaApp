//
//  UsersViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var InstructionsLabel: UILabel!
    
    @IBOutlet weak var GetUserButton: UIButton!
    @IBOutlet weak var EditUserRegistrationButton: UIButton!
    
    @IBOutlet weak var UserRegistrationTableView: UITableView!
    
    // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Users"

        customTableView()
        customLabels()
        customButtons()
    }
    
    @IBAction func GetUserButtonTapped(_ sender: Any) {

    }
    
    private func customTableView() {
        UserRegistrationTableView.delegate = self
        UserRegistrationTableView.dataSource = self
        UserRegistrationTableView.register(UINib(nibName: "RegistrationTableViewCell", bundle: nil), forCellReuseIdentifier: "RegistrationTableViewCell")
        UserRegistrationTableView.layer.borderWidth = 1
        UserRegistrationTableView.layer.borderColor = UIColor.label.cgColor
        UserRegistrationTableView.layer.cornerRadius = 20
    }
    
    private func customLabels() {
        InstructionsLabel.text = "Profile"
        InstructionsLabel.myCustomFont(size: 25, textColor: .systemGreen)
    }
    
    private func customButtons() {
        GetUserButton.backgroundColor = .systemGreen
        GetUserButton.setTitle("Get user", for: .normal)
        GetUserButton.setTitleColor(.white, for: .normal)
        GetUserButton.titleLabel?.font = UIFont(name: UIFont.nameOf.Futura_Bold.rawValue, size: 18)
        
        EditUserRegistrationButton.backgroundColor = .systemGray
        EditUserRegistrationButton.setTitle("Edit registration", for: .normal)
        EditUserRegistrationButton.setTitleColor(.label, for: .normal)
        EditUserRegistrationButton.titleLabel?.font = UIFont(name: UIFont.nameOf.Futura_Bold.rawValue, size: 18)
        
    }

}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationTableViewCell", for: indexPath) as! RegistrationTableViewCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
