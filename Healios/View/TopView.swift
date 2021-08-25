//
//  TopView.swift
//  Fedon
//
//  Created by Zohrab Keshishyan on 3/5/21.
//

import Foundation
import UIKit

protocol TopViewDelegate: AnyObject {
    func rightAction()
    func leftAction()
}

class TopView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var leftImageView: UIImageView?
    @IBOutlet weak var leftView: UIView?
    @IBOutlet weak var leftButton: UIButton?
    @IBOutlet weak var rightView: UIView?
    @IBOutlet weak var heightConstraint: NSLayoutConstraint?
    
    weak var delegate: TopViewDelegate?
    var defoultHeight:CGFloat = 70
    
    override func didMoveToWindow() {
        heightConstraint?.constant = defoultHeight + NativeBoundsSize.topHeight()
    }
    
    func configure(_ title: String) {
        heightConstraint?.constant = defoultHeight + NativeBoundsSize.topHeight()
        titleLabel?.text = title
    }
    
    @IBAction func leftAction(_ sender: UIButton) {
        delegate?.leftAction()
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        delegate?.rightAction()
    }
}

