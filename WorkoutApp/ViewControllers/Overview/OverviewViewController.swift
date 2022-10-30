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
        
        view.addView(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
    }
}

@objc extension OverviewViewController {
    
}
