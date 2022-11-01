//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 01.11.2022.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            nameLabel.text = name.uppercased()
            dateLabel.text = "\(index)"
        }
    }
}

extension WeekView.WeekDayView {
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = .red
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resources.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resources.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}

