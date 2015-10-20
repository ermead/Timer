//
//  AppearanceController.swift
//  Timer
//
//  Created by Eric Mead on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearance(){
        
        UINavigationBar.appearance().barTintColor = UIColor.blueColor1()
        UITabBar.appearance().barTintColor = UIColor.blueColor1()
        UIButton.appearance().backgroundColor = UIColor.bluishGreenColor1()
        //UIView.appearance().backgroundColor = UIColor.yellowColor1()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.yellowColor1()]
      
        
        
    }
    
}
