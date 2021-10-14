//
//  TimerScreenViewController.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class TimerScreenViewController: UIViewController {
    var pill = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .white
        pill = UIView(frame: CGRect(x: view.bounds.width / 2, y: 0, width: 40, height: 4))
        pill.backgroundColor = .black.withAlphaComponent(0.5)
        pill.layer.cornerRadius = 8
        view.addSubview(pill)
        pill.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
    }
}
