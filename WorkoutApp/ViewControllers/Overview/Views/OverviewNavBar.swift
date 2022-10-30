//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 30.10.2022.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    private let titleLabel = UILabel()
}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()
        
        addSubview(allWorkoutsButton)
        addSubview(titleLabel)
        addSubview(addButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white
        addBottomBorder(with: Resources.Colors.separator, height: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = Resources.Strings.NavBar.overview
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Fonts.helveticaRegular(with: 22)
        
        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(title: Resources.Strings.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

@objc extension OverviewNavBar {
    func allWorkoutsButtonAction() {
        print("button pressed")
    }
}
