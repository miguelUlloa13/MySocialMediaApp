//
//  RegistrationTableViewCell.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var UserAddressLabel: UILabel!
    @IBOutlet weak var UserPostCodeLabel: UILabel!
    @IBOutlet weak var UserEmailLabel: UILabel!
    
    @IBOutlet weak var UsernameContentLabel: UILabel!
    @IBOutlet weak var UserAddressContentLabel: UILabel!
    @IBOutlet weak var UserPostCodeContentLabel: UILabel!
    @IBOutlet weak var UserEmailContentLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        customLabels()
    }
    
    private func customLabels() {
        UsernameLabel.text = "Username:"
        UsernameLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        UsernameContentLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        
        UserAddressLabel.text = "Address:"
        UserAddressLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        UserAddressContentLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        
        UserPostCodeLabel.text = "Post code:"
        UserPostCodeLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        UserPostCodeContentLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        
        UserEmailLabel.text = "Email:"
        UserEmailLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        UserEmailContentLabel.myCustomFont(size: 18, textColor: .label, textAlignment: .left)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
