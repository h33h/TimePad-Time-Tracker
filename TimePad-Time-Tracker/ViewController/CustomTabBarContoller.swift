//
//  CustomTabBarContoller.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 11.10.21.
//

import UIKit

class CustomTabBarContoller: UITabBarController, UITabBarControllerDelegate {
    private var service = Service()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarInit()
        serviceInit()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupMiddleButton()
        setupLeftButton()
        setupRightButton()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TimerScreenViewController {
            (segue.destination as? TimerScreenViewController)?.currentGroup = service.todayTasks.currentTaskGroup
        }
    }
}

extension CustomTabBarContoller {
    func tabBarInit() {
        delegate = self
        selectedIndex = 1
        tabBar.items?.forEach { $0.isEnabled = false }
    }
    func serviceInit() {
        service.fetchTasks()
        (children[0] as? MainViewController)?.service = service
    }
}

extension CustomTabBarContoller {
    func setupLeftButton() {
        let leftButton = UIButton(frame: CGRect(
            x: tabBar.frame.origin.x + 40,
            y: 8,
            width: 28,
            height: 28
        )
        )
        leftButton.setImage(UIImage(named: "time.outline"), for: .normal)
        leftButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        leftButton.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        tabBar.addSubview(leftButton)
        view.layoutIfNeeded()
    }
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(
            x: view.bounds.width / 2 - 22,
            y: 0,
            width: 44,
            height: 44
        )
        )
        middleButton.clipsToBounds = true
        middleButton.tintColor = .white
        middleButton.backgroundColor = UIColor.black
        middleButton.setImage(UIImage(named: "add"), for: .normal)
        middleButton.layer.cornerRadius = middleButton.frame.size.width / 2
        middleButton.addTarget(self, action: #selector(middleAction), for: .touchUpInside)
        tabBar.addSubview(middleButton)
        view.layoutIfNeeded()
    }
    func setupRightButton() {
        let rightButton = UIButton(frame: CGRect(
            x: tabBar.frame.size.width - (40 + 28),
            y: 8,
            width: 28,
            height: 28
        )
        )
        rightButton.setImage(UIImage(named: "pie.chart"), for: .normal)
        rightButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        rightButton.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        tabBar.addSubview(rightButton)
        view.layoutIfNeeded()
    }
    @objc
    func middleAction(sender: UIButton) {
        selectedIndex = 1
    }
    @objc
    func leftAction(sender: UIButton) {
        performSegue(withIdentifier: "Timer", sender: UIButton.self)
    }
    @objc
    func rightAction(sender: UIButton) {
        selectedIndex = 2
    }
}
