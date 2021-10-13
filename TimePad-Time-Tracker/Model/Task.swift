//
//  Task.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public protocol TaskProtocol: TagProtocol {
    var time: Time { get }
    func start()
    func stop()
}

public final class Task: TaskProtocol {
    private var taskColor: Color?
    private var timer: Timer
    private var timeValue: Int
    public var title: String
    public var color: Color? {
        taskColor
    }
    public var time: Time {
        timeValue.secondsToHoursMinutesSeconds()
    }
    required init (taskTitle title: String, taskColor color: Color?) {
        self.title = title
        self.taskColor = color
        self.timeValue = 0
        self.timer = Timer()
    }
    convenience init (taskTitle title: String) {
        self.init(taskTitle: title, taskColor: nil)
    }
    convenience init() {
        self.init(taskTitle: "")
    }
    public func start() {
        timer = Timer(timeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timeValue += 1
        }
    }
    public func stop() {
        timer.invalidate()
    }
}
