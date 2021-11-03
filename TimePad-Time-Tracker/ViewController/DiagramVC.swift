//
//  DiagramVC.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 16.10.21.
//

import UIKit

class DiagramVC: UIViewController {

    @IBOutlet private var durationStack: UIStackView!
    @IBOutlet private var timeStack: UIStackView!
    @IBOutlet private var diagramView: DiagramView!
    override func viewDidLoad() {
        super.viewDidLoad()
        diagramView.durationStack = durationStack
        diagramView.timeStack = timeStack
        // Do any additional setup after loading the view.
    }
}
