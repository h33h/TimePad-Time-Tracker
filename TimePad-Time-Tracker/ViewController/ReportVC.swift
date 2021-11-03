//
//  ReportVC.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 16.10.21.
//

import UIKit

class ReportVC: UIViewController {

    @IBOutlet private var taskCompletedView: UIView!
    @IBOutlet private var timeDurationView: UIView!
    @IBOutlet private var segmentControl: UISegmentedControl!
    @IBOutlet private var diagramView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskCompletedView.backgroundColor = .white
        taskCompletedView.layer.cornerRadius = 16
        timeDurationView.backgroundColor = .white
        timeDurationView.layer.cornerRadius = 16
        diagramView.backgroundColor = .white
        diagramView.layer.cornerRadius = 16
    }
    @IBAction private func backAction(_ sender: Any) {
        tabBarController?.selectedIndex = 0
        (tabBarController?.tabBar.subviews[5] as? UIButton)?.setImage(UIImage(named: "pie.chart"), for: .normal)
    }
}
