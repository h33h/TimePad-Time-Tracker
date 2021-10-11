//
//  CurrentTaskViewController.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 11.10.21.
//

import UIKit

class CurrentTaskViewController: UIViewController {

    @IBOutlet
    private var currentTask: UIView!
    @IBOutlet
    private var moreButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTask.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
