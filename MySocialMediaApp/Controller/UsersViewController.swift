//
//  UsersViewController.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

class UsersViewController: UIViewController, DataManagerDelegate {
    
    @IBOutlet weak var HeaderView: HeaderView!
    
    @IBOutlet weak var InstructionsLabel: UILabel!
    
    @IBOutlet weak var GetUserButton: UIButton!
    
    @IBOutlet weak var UserRegistrationTableView: UITableView!
    
    // MARK: - Properties
    let apiClient = APIClient()
    var cDH = CoreDataHelper.self

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
        cDH.recuperarArregloDesdeCoreData()
        UserRegistrationTableView.reloadData()
        
    }

    
    @IBAction func GetUserButtonTapped(_ sender: Any) {
        Task{
            let result = await apiClient.getUser()
            switch result {
            case .success(let model):
                print(model.results)
                cDH.guardarArregloEnCoreData(model.results)

            case .failure(let error):
                print(error)
            }
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
        return cDH.userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editRegistrationVC = EditRegistrationViewController(userEdit: cDH.userArray![indexPath.row], indexPath: indexPath)
        editRegistrationVC.delegate = self
        self.navigationController?.pushViewController(editRegistrationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func dataDidUpdate(indexPath: IndexPath, userEdit: Users) {
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
