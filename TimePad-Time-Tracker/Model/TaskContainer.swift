//
//  TaskContainer.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public protocol TaskContainerProtocol: TaskProtocol {
    var iconTitle: String { get set }
    var tag: Tag? { get }
    var tasks: [Task] { get }
}

public final class TaskContainer: TaskContainerProtocol {
    private var tagValue: Tag?
    private var tasksArray: [Task]
    private var currentTask: Task?
    private var currentTaskColor: Color?
    private var time: Int
    private var timer: Timer
    public var title: String
    public var iconTitle: String
    public var color: Color {
        currentTaskColor ?? Color(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
    }
    public var tag: Tag? {
        tagValue
    }
    public var tasks: [Task] {
        tasksArray
    }
    public var timeValue: Time {
        time.secondsToHoursMinutesSeconds()
    }
    required init (containerTitle title: String, containerIconTitle icon: String, tag: Tag?, tasks: [Task]) {
        self.title = title
        self.iconTitle = icon
        self.tagValue = tag
        self.tasksArray = tasks
        self.time = 0
        self.timer = Timer()
    }
    convenience init (containerTitle title: String) {
        self.init(containerTitle: title, containerIconTitle: "noIcon", tag: nil, tasks: [Task]())
    }
    public func selectCurrentTask(title: String) {
        for task in tasks where task.title == title {
            currentTask = task
        }
    }
    public func pushTask(task: Task) {
        tasksArray.append(task)
    }
    public func removeTask(title: String) {
        for (index, task) in tasksArray.enumerated() where task.title == title {
            tasksArray.remove(at: index)
        }
    }
    public func start() {
        guard let currentTask = currentTask else {
            return
        }
        currentTask.start()
        timer = Timer(timeInterval: 1.0, repeats: true, block: {[weak self] _ in
            self?.time += 1
        })
    }
    public func stop() {
        guard let currentTask = currentTask else {
            return
        }
        currentTask.stop()
        timer.invalidate()
    }
}
