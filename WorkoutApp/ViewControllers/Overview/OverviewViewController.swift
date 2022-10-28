//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 19.10.2022.
//

import UIKit

class OverviewViewController: BaseController {

    private let allWorkoutsButton = SecondaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.overview
    }


}

extension OverviewViewController {
    override func addViews() {
        super.addViews()
        view.addSubview(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            allWorkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    override func configure() {
        super.configure()
        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(title: Resources.Strings.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .touchUpInside)
    }
}

@objc extension OverviewViewController {
    func allWorkoutsButtonAction() {
        print("button pressed")
    }
}
