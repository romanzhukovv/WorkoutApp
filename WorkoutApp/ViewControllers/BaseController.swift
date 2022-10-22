//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 22.10.2022.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

@objc extension BaseController {
    
    private func addViews() {
        
    }
    
    private func layoutViews() {
        
    }
    
    private func configure() {
        view.backgroundColor = Resources.Colors.background
    }
}
