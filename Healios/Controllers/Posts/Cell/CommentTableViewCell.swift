//
//  CommentTableViewCell.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    static let identifier = "CommentTableViewCell"
    
    @IBOutlet var titlLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!

    func configure(comment: CommentModel) {
        titlLabel.text = comment.name
        descLabel.text = comment.body
        emailLabel.text = comment.email
    }
}
