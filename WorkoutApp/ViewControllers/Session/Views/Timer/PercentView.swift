//
//  PercentView.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 18.11.2022.
//

import UIKit

extension TimerView {
    final class PercentView: BaseView {
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 23)
            label.textColor = Resources.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 10)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            return label
        }()
        
        override func addViews() {
            super.addViews()
            
            addView(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subTitleLabel)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        func configurePercent(with subTitle: String, and value: Int) {
            subTitleLabel.text = subTitle
            percentLabel.text = "\(value)%"
        }
    }
}
