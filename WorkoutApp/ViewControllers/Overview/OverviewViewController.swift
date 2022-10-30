//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 19.10.2022.
//

import UIKit

class OverviewViewController: BaseController {
    
    private let navBar = OverviewNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.overview
    }


}

extension OverviewViewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(navBar)
        view.addSubview(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 113)
        ])
    }
    
    override func configure() {
        super.configure()
        navBar.translatesAutoresizingMaskIntoConstraints = false
    }
}

@objc extension OverviewViewController {
    
}
