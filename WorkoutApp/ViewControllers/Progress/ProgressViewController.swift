//
//  ProgressViewController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 22.10.2022.
//

import UIKit

class ProgressViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.progress
        tabBarItem.title = Resources.Strings.TabBar.progress
        
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }


}
