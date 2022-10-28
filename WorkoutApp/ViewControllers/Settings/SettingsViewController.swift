//
//  SettingsViewController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 22.10.2022.
//

import UIKit

class SettingsViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.settings
        tabBarItem.title = Resources.Strings.TabBar.settings
    }


}
