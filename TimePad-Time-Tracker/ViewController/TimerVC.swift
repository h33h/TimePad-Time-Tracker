//
//  TimerVC.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 16.10.21.
//

import UIKit

class TimerVC: UIViewController {
    var time: Time? {
        didSet {
            DispatchQueue.main.async {
                self.timeLabel.text = "\(String(format: "%.2d", self.time?.minutes ?? 0)):\(String(format: "%.2d", self.time?.seconds ?? 0))"
                self.timerView.setAngle(seconds: self.time?.toSeconds() ?? 0)
                self.timerView.setNeedsDisplay()
            }
        }
    }
    var timeLabel: UILabel = {
        let labelTime = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        labelTime.textColor = .black
        labelTime.font = UIFont.boldSystemFont(ofSize: 40)
        labelTime.isHidden = true
        return labelTime
    }()
    var timerView = TimerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect.zero
        view.addSubview(timeLabel)
        view.addSubview(timerView)
        timerView.translatesAutoresizingMaskIntoConstraints = false
        timerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        timerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        timerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        timeLabel.frame = CGRect(x: 0, y: 0, width: timerView.bounds.width / 2, height: timerView.bounds.height / 2)
        timerView.setAngle(seconds: time?.toSeconds() ?? 0)
        timeLabel.center = timerView.center
        timeLabel.text = "\(String(format: "%.2d", time?.minutes ?? 0)):\(String(format: "%.2d", time?.seconds ?? 0))"
        timeLabel.isHidden = false
    }
}
