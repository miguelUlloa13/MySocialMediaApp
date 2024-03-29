//
//  HeaderView.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 07/03/24.
//

import UIKit

// @IBDesignable
final class HeaderView: UIView {

    @IBOutlet weak var AppNameLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    
    @IBOutlet weak var LogOutButton: UIButton!
    
    // MARK: - Properties
    var navBar = UINavigationController()
    
    // MARK: - Lyfe cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.customLabels()
        self.customButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
        self.customLabels()
        self.customButtons()
    }
    
    // MARK: - Methods
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "HeaderView") else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func customLabels() {

        AppNameLabel.text = "MySocialMediaApp"
        AppNameLabel.myCustomFont(size: 30, textColor: .green, textAlignment: .right)
        
        UsernameLabel.text = "User: Admin"
        UsernameLabel.myCustomFont(size: 20, textColor: .label)
       
    }
    
    private func customButtons() {
        LogOutButton.backgroundColor = .systemGreen
        LogOutButton.setTitle("Log out", for: .normal)
        LogOutButton.setTitleColor(.white, for: .normal)
        LogOutButton.titleLabel?.font = UIFont(name: UIFont.nameOf.Futura_Bold.rawValue, size: 20)
        LogOutButton.round()
        
    }
    
    @IBAction func LogOutButtonTapped(_ sender: Any) {
        
        KeychainHelper.deleteCredentials()
        navBar.popToRootViewController(animated: true)
        
    }
    
    
}
