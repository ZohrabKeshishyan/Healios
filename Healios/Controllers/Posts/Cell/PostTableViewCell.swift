//
//  PostTableViewCell.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    func configure(post: PostModel) {
        titleLabel.text = post.title
        descLabel.text = post.body
    }
    
}
