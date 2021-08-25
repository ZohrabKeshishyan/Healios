//
//  File.swift
//  Fedon
//
//  Created by Zohrab Keshishyan on 3/5/21.
//

import UIKit

class Controllers {
    
    class func postDetails() -> PostDetailsViewController {
        return controllerAt("Main", identifier: "PostDetailsViewController") as! PostDetailsViewController
    }
    
    class func controllerAt(_ storyboardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
