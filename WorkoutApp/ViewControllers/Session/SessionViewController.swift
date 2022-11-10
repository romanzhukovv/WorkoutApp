//
//  SesionViewController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 22.10.2022.
//

import UIKit

class SessionViewController: BaseController {
    
    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "Timer")
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.session
        tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarRight)
    }

}

extension SessionViewController {
    override func addViews() {
        super.addViews()
        
        view.addView(timerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configure() {
        super.configure()
    }
}
