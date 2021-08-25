//
//  BaseViewController.swift
//  Fedon
//
//  Created by Zohrab Keshishyan on 3/5/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet var topView: TopView?
    
    @IBOutlet weak var alertLabel: UILabel?
    @IBOutlet weak var alertTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView?.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    //MARK: - TopAlerView
    
    func show(text:String, timeInterval: Double = 2) {
        self.alertLabel?.text = text
        
        UIView.animate(withDuration: 0.5, animations: {
            self.alertTopConstraint?.constant = 1
            self.view.layoutIfNeeded()
        },completion:{(finished:Bool)  in
            if #available(iOS 10.0, *) {
                Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: {_ in
                                        self.hideConnetionErrorView()                })
            } else {
                self.hideConnetionErrorView()            }
        })
        
    }
    
    
    func hideConnetionErrorView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alertTopConstraint?.constant = -35
            self.view.layoutIfNeeded()
        },completion:{(finished:Bool)  in  })
        
    }
}

//MARK: TopViewDelegate

extension BaseViewController: TopViewDelegate {
    @objc func rightAction() { }
    
    @objc func leftAction() {
        dissmis_()
    }
    
    @objc func dissmis_() {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
}

