//
//  ProfileView.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import UIKit

class ProfileView: UIView {

    //MARK: - IBOutlets
    
    @IBOutlet weak var imagView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!

    func configure(user: UserModel) {
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        
        streetLabel.text = user.address?.street
        webSiteLabel.text = user.website
    }
}
