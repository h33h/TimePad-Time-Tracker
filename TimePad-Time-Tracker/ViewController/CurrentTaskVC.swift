//
//  CurrentTaskVC.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class CurrentTaskVC: UIViewController {
    var currentTask: TaskProtocol? { didSet {
        timeLabel.text = currentTask?.time.toString()
        currentTaskLabel.text = currentTask?.title
        circleView.startColor = currentTask?.color?.convertColor()
    }}
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentTaskLabel: UILabel!
    @IBOutlet weak var circleView: CircleView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
