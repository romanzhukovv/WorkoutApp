//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 12.11.2022.
//

import UIKit

final class TimerView: WABaseInfoView {
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(with: 0.0)
        return view
    }()
}

extension TimerView {
    override func addViews() {
        super.addViews()
        addView(progressView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
}
