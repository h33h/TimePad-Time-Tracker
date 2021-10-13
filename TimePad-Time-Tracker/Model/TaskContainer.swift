//
//  TaskContainer.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public final class TaskContainer {
    private var tagValue: TagProtocol?
    private var tasksArray: [TaskProtocol]
    private var curTask: TaskProtocol?
    private var timeValue: Int {
        var allTime = 0
        for task in tasksArray {
            allTime += task.time.toSeconds()
        }
        return allTime
    }
    private var iconTitle: String
    public var title: String
    public var tag: TagProtocol? {
        tagValue
    }
    public var tasks: [TaskProtocol] {
        tasksArray
    }
    public var currentTask: TaskProtocol? {
        curTask
    }
    required init (containerTitle title: String,
                   containerIconTitle icon: String,
                   tag: TagProtocol? = nil,
                   tasks: [TaskProtocol] = [TaskProtocol]()) {
        self.title = title
        self.iconTitle = icon
        self.tagValue = tag
        self.tasksArray = tasks
        guard !tasksArray.isEmpty && (currentTask == nil) else { return }
        self.curTask = tasksArray.first
    }
    convenience init (containerTitle title: String) {
        self.init(containerTitle: title, containerIconTitle: "")
    }
    convenience init () {
        self.init(containerTitle: "")
    }
    public func selectCurrentTask(title: String) {
        for task in tasks where task.title == title {
            curTask = task
        }
    }
    public func setTag (tag: TagProtocol) {
        tagValue = tag
    }
    public func pushTask(task: TaskProtocol) {
        tasksArray.append(task)
    }
    public func removeTask(title: String) {
        for (index, task) in tasksArray.enumerated() where task.title == title {
            tasksArray.remove(at: index)
        }
    }
}
