//
//  CurrentTaskVC.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class CurrentTaskVC: UIViewController {
    var currentGroup: TaskContainer? {
        didSet {
            timeLabel.text = currentGroup?.currentTask?.time.toString()
            currentTaskLabel.text = currentGroup?.currentTask?.title
            circleView.startColor = currentGroup?.currentTask?.color?.convertColor()
        }
    }
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var currentTaskLabel: UILabel!
    @IBOutlet private var circleView: CircleView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.clickAction))
        self.view.addGestureRecognizer(gesture)
    }
    @objc
    func clickAction(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "Timer1", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TimerScreenViewController {
            (segue.destination as? TimerScreenViewController)?.currentGroup = currentGroup
        }
    }
}
