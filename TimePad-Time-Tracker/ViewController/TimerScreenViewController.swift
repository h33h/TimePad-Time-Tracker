//
//  TimerScreenViewController.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class TimerScreenViewController: UIViewController {
    var pill = UIView()
    var currentTaskLabel = UILabel()
    var circleView = CircleView()
    var taskGroupLabel = UILabel()
    var tagLabel = TagView()
    var finishButton = UIButton()
    var quitButton = UIButton()
    var timerView = TimerVC()
    var currentGroup: TaskContainer? {
        didSet {
            currentTaskLabel.text = currentGroup?.currentTask?.title
            circleView.startColor = currentGroup?.currentTask?.color?.convertColor()
            tagLabel.text = currentGroup?.tag?.title
            tagLabel.textColor = currentGroup?.tag?.color?.convertColor()
            taskGroupLabel.text = currentGroup?.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pillInit()
        currentTaskLabelInit()
        circleViewInit()
        taskGroupLabelInit()
        tagLabelInit()
        quitButtonInit()
        finishButtonInit()
        timerViewInit()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTime),
            name: Notification.Name(rawValue: "timeValueUpdate"),
            object: nil
        )
    }
}

extension TimerScreenViewController {
    func pillInit() {
        pill.backgroundColor = UIColor(red: 0.913, green: 0.913, blue: 1, alpha: 1)
        pill.layer.cornerRadius = 8
        view.addSubview(pill)
        pill.translatesAutoresizingMaskIntoConstraints = false
        pill.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        pill.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        pill.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pill.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    func currentTaskLabelInit() {
        currentTaskLabel.textColor = .black
        currentTaskLabel.text = currentGroup?.currentTask?.title
        currentTaskLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(currentTaskLabel)
        currentTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTaskLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        currentTaskLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
    }
    func circleViewInit() {
        circleView.startColor = currentGroup?.currentTask?.color?.convertColor()
        circleView.endColor = .white
        circleView.backgroundColor = .white
        view.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.topAnchor.constraint(equalTo: currentTaskLabel.bottomAnchor, constant: 18).isActive = true
        circleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    func taskGroupLabelInit() {
        taskGroupLabel.textColor = .black
        taskGroupLabel.text = currentGroup?.title
        taskGroupLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(taskGroupLabel)
        taskGroupLabel.translatesAutoresizingMaskIntoConstraints = false
        taskGroupLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 12).isActive = true
        taskGroupLabel.topAnchor.constraint(equalTo: currentTaskLabel.bottomAnchor, constant: 18).isActive = true
    }
    func tagLabelInit() {
        tagLabel.text = currentGroup?.tag?.title
        tagLabel.textColor = currentGroup?.tag?.color?.convertColor()
        tagLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(tagLabel)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        tagLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 74).isActive = true
    }
    func quitButtonInit() {
        quitButton.setTitle("Quit", for: .normal)
        quitButton.setTitleColor(UIColor(red: 0.027, green: 0.016, blue: 0.09, alpha: 1).withAlphaComponent(0.7), for: .normal)
        quitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        quitButton.frame = CGRect(x: quitButton.frame.origin.x,
                                  y: quitButton.frame.origin.y,
                                  width: quitButton.titleLabel?.bounds.width ?? 0,
                                  height: quitButton.titleLabel?.bounds.height ?? 0)
        view.addSubview(quitButton)
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        quitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -102).isActive = true
    }
    func finishButtonInit() {
        finishButton.setTitle(currentGroup?.currentTask?.isEnabled ?? false ? "Finish" : "Start", for: .normal)
        finishButton.setTitleColor(UIColor(red: 0.027, green: 0.016, blue: 0.09, alpha: 1), for: .normal)
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        finishButton.backgroundColor = UIColor(red: 0.913, green: 0.913, blue: 1, alpha: 1)
        finishButton.clipsToBounds = true
        finishButton.layer.cornerRadius = 8
        finishButton.addTarget(self, action: #selector(startButton), for: .touchUpInside)
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finishButton.heightAnchor.constraint(equalTo: finishButton.titleLabel?.heightAnchor ?? NSLayoutAnchor(), constant: 40).isActive = true
        finishButton.bottomAnchor.constraint(equalTo: quitButton.topAnchor, constant: -24).isActive = true
    }
    func timerViewInit() {
        timerView.time = currentGroup?.currentTask?.time
        addChild(timerView)
        view.addSubview(timerView.view)
        timerView.didMove(toParent: self)
        timerView.view.translatesAutoresizingMaskIntoConstraints = false
        timerView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 78).isActive = true
        timerView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -78).isActive = true
        timerView.view.topAnchor.constraint(equalTo: taskGroupLabel.bottomAnchor, constant: 100).isActive = true
        timerView.view.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: -100).isActive = true
        timerView.view.widthAnchor.constraint(equalTo: timerView.view.heightAnchor).isActive = true
    }
}

extension TimerScreenViewController {
    @objc
    func startButton(sender: UIButton) {
        if currentGroup?.currentTask?.isEnabled ?? false {
            currentGroup?.currentTask?.stop()
            finishButton.setTitle("Start", for: .normal)
        } else {
            currentGroup?.currentTask?.start()
            finishButton.setTitle("Finish", for: .normal)
        }
    }
    @objc
    func updateTime(sender: NotificationCenter) {
        timerView.time = currentGroup?.currentTask?.time ?? Time(hours: 0, minutes: 0, seconds: 0)
    }
}
