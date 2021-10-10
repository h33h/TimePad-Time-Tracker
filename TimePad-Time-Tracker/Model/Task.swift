//
//  Task.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public protocol TaskProtocol: TagProtocol {
    var timeValue: Time { get }
    func start()
    func stop()
}

public final class Task: TaskProtocol {
    private var taskColor: Color
    private var timer: Timer
    private var time: Double
    public var title: String
    public var color: Color {
        taskColor
    }
    public var timeValue: Time {
        time.secondsToHoursMinutesSeconds()
    }
    required init (taskTitle title: String, taskColor color: Color) {
        self.title = title
        self.taskColor = color
        self.timer = Timer()
        self.time = 0.0
    }
    public func start() {
        timer = Timer(timeInterval: 1.0, repeats: true, block: {[weak self] _ in
            self?.time += 1.0
        })
    }
    public func stop() {
        timer.invalidate()
    }
}
