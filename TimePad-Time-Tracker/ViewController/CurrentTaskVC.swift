//
//  CurrentTaskVC.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class CurrentTaskVC: UIViewController {
    var currentTask: TaskProtocol? {
        didSet {
            timeLabel.text = currentTask?.time.toString()
            currentTaskLabel.text = currentTask?.title
            circleView.startColor = currentTask?.color?.convertColor()
        }
    }
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var currentTaskLabel: UILabel!
    @IBOutlet private var circleView: CircleView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
