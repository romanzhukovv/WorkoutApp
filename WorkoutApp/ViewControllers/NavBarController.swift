//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 22.10.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleGray,
            .font: Resources.Fonts.helveticaRegular(with: 17)
        ]
    }
}
