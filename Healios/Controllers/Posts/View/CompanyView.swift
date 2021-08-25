//
//  CommentsView.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import Foundation
import UIKit

class CompanyView: UIView {

    //MARK: - IBOutlets
     
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!

    func configure(company: CompanyModel) {
        nameLabel.text = company.name
        catchPhraseLabel.text = company.catchPhrase
        bsLabel.text = company.bs
    }
}
