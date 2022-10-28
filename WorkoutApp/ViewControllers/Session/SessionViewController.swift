//
//  SesionViewController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 22.10.2022.
//

import UIKit

class SessionViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.session
        tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarRight)
    }

}
