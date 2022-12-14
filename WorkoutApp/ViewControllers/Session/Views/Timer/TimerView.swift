//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 12.11.2022.
//

import UIKit

enum TimerState {
    case isRunning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTime
        label.font = Resources.Fonts.helveticaRegular(with: 14)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 46)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainingTime
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.spacing = 25
        return view
    }()
    
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
    
    var callback: ((CGFloat) -> Void)?
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDivider
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLabel.text = getDispalyedString(from: Int(tempCurrentValue))
        remainingTimeValueLabel.text = getDispalyedString(from: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configurePercent(with: "COMPLETED", and: roundedPercent)
        remainingPercentView.configurePercent(with: "REMAINING", and: 100 - roundedPercent)
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.callback?(self.timerProgress)
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            
            self.timerProgress -= self.timerProgress / 30
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func addViews() {
        super.addViews()
        
        addView(progressView)
        addView(timeStackView)
        addView(bottomStackView)
        
        [
            elapsedTimeLabel,
            elapsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach {
            timeStackView.addArrangedSubview($0)
        }
        
        
        [
            completedPercentView,
            bottomSeparatorView,
            remainingPercentView
        ].forEach(bottomStackView.addArrangedSubview)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1),
            remainingPercentView.widthAnchor.constraint(equalToConstant: 80),
            completedPercentView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
//        layoutIfNeeded()
    }
}

private extension TimerView {
    func getDispalyedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0 ?
        [minutesStr, secondsStr].joined(separator: ":") :
        [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}
