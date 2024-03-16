//
//  UsersViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

class UsersViewController: UIViewController, DataManagerDelegate {
    
    // MARK: - Outlets
        // Views
    @IBOutlet weak private var HeaderView: HeaderView!
    
        // Labels
    @IBOutlet weak private var InstructionsLabel: UILabel!
    
        // Buttons
    @IBOutlet weak private var GetUserButton: UIButton!
    
        // Table view
    @IBOutlet weak private var UserRegistrationTableView: UITableView!
    
    // MARK: - Properties
    private let apiClient = APIClient()     // Instace to api call
    private var cDH = CoreDataHelper.self   // Save user in internal base

    // MARK: - Constructor
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Users"
        self.navigationItem.setHidesBackButton(true, animated: true)

        self.HeaderView.navBar = self.navigationController!
        customTableView()
        customLabels()
        customButtons()
        cDH.retrieveArrayFromCoreData()
        UserRegistrationTableView.reloadData()
        
    }
    
    // MARK: - Methods

    /// Action to perform after pressing GetUser button
    /// - Parameter sender: UIButton
    @IBAction private func GetUserButtonTapped(_ sender: UIButton) {
        Task{
            let result = await apiClient.getUser()
            switch result {
            case .success(let model):
                // The user was obtained correctly
                print(model.results)
                cDH.saveArrayInCoreData(model.results)

            case .failure(let error):
                // An error occurred while calling the api
                print(error)
            }
            // Update table view
            self.UserRegistrationTableView.reloadData()
        }
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
        
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Numbers of rows
        return cDH.userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Populate table view
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationTableViewCell", for: indexPath) as! RegistrationTableViewCell
        
        let title = cDH.userArray?[indexPath.row].title
        let first = cDH.userArray?[indexPath.row].first
        let last = cDH.userArray?[indexPath.row].last

        let city = cDH.userArray?[indexPath.row].city
        let state = cDH.userArray?[indexPath.row].state
        let country = cDH.userArray?[indexPath.row].country
        
        let postCode = cDH.userArray?[indexPath.row].postcode.description
        
        let email = cDH.userArray?[indexPath.row].email
        
        
        if let unwrappedTitle = title, let  unwrappedFirst = first, let unwrappedLast = last {
            let username = "\(unwrappedTitle) \(unwrappedFirst) \(unwrappedLast)"
            cell.UsernameContentLabel.text = username
        } else {
            cell.UsernameContentLabel.text = "No"
        }
        
        if let unwrappedCity = city, let  unwrappedState = state, let unwrappedCountry = country {
            let address = "\(unwrappedCity), \(unwrappedState), \(unwrappedCountry)"
            cell.UserAddressContentLabel.text = address
        } else {
            cell.UserAddressContentLabel.text = "No"
        }
        
        if let unwrappedPostCode = postCode {
            cell.UserPostCodeContentLabel.text = unwrappedPostCode
        } else {
            cell.UserPostCodeContentLabel.text = "No"
        }
        
        if let unwrappedEmail = email {
            cell.UserEmailContentLabel.text = unwrappedEmail
        } else {
            cell.UserEmailContentLabel.text = "No"
        }
        
        cell.UserCounterLabel.text = "User: \(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Action to perform after pressing a cell
        let editRegistrationVC = EditRegistrationViewController(userEdit: cDH.userArray![indexPath.row], indexPath: indexPath)
        editRegistrationVC.delegate = self
        self.navigationController?.pushViewController(editRegistrationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Cell size
        return 300
    }
    
    func dataDidUpdate(indexPath: IndexPath, userEdit: Users) {
        // Protocol to update the cell
        self.cDH.userArray?[indexPath.row] = userEdit
        do {
            try cDH.managedContext.save()
            print("Item guardado en Core Data: \(userEdit)")
        } catch {
            print("Error al guardar el item en Core Data: \(error)")
        }
        self.UserRegistrationTableView.reloadData()
    }
}
