//
//  DayContainer.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import Foundation

public protocol DayContainerProtocol {
    var taskGroups: [TaskContainer] { get }
    var currentTaskGroup: TaskContainer? { get }
    func selectCurrentTaskGroup(title: String)
    func pushTaskGroup(taskGroup: TaskContainer)
    func removeTaskGroup(title: String)
}

public final class TodayTasks: DayContainerProtocol {
    private var allTaskGroups: [TaskContainer]
    private var curTaskGroup: TaskContainer? {
        get {
            !allTaskGroups.isEmpty ? allTaskGroups.first : nil
        }
        set {
            allTaskGroups.insert(newValue ?? TaskContainer(), at: 0)
        }
    }
    public var taskGroups: [TaskContainer] {
        allTaskGroups
    }
    public var currentTaskGroup: TaskContainer? {
        curTaskGroup
    }
    public var count: Int {
        allTaskGroups.count
    }
    required init(taskGroups: [TaskContainer] = [TaskContainer]()) {
        self.allTaskGroups = taskGroups
        guard !taskGroups.isEmpty && (currentTaskGroup) == nil else { return }
        self.curTaskGroup = taskGroups.first
    }
    public func selectCurrentTaskGroup(title: String) {
        for (index, group) in allTaskGroups.enumerated() where group.title == title {
            curTaskGroup = group
            allTaskGroups.remove(at: index + 1)
        }
    }
    public func pushTaskGroup(taskGroup: TaskContainer) {
        allTaskGroups.append(taskGroup)
    }
    public func removeTaskGroup(title: String) {
        for (index, group) in allTaskGroups.enumerated() where group.title == title {
            allTaskGroups.remove(at: index)
        }
    }
}
