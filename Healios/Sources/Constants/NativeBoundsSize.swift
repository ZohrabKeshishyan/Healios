//
//  NativeBoundsSize.swift
//  Fedon
//
//  Created by Zohrab Keshishyan on 3/5/21.
//
 
import Foundation
import UIKit

struct NativeBoundsSize {
    
    static func topHeight() -> CGFloat {
        if UIDevice().userInterfaceIdiom == .phone {
            if isiPhoneX() {
                return 20
            }
        }
        return 0
    }
    
    static func bottomHeight() -> CGFloat {
        if UIDevice().userInterfaceIdiom == .phone {
            if isiPhoneX() {
                return 15
            }
        }
        return 0
    }
    
    static func isiPhoneX() -> Bool{
        switch UIScreen.main.nativeBounds.height {
        case 2436, 2688, 1792, 2532, 2340, 2778:
            return true
        default:
            return false
        }
    }
}
