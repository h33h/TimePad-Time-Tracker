//
//  Service.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import Foundation

public final class Service {
    private var staticData: [TaskContainer] = {
        var temp = [TaskContainer]()
        temp.append(TaskContainer(containerTitle: "UI Design",
                                  containerIconTitle: "monitor",
                                  tag: Tag(tagTitle: "Work",
                                           tagColor: Color(red: 0.992,
                                                           green: 0.357,
                                                           blue: 0.443,
                                                           alpha: 1)),
                                  tasks: [Task(taskTitle: "Rasion Project",
                                               taskColor: Color(red: 0.608,
                                                                green: 0.318,
                                                                blue: 0.878,
                                                                alpha: 1))]))
        temp.append(TaskContainer(containerTitle: "100x Sit-Up",
                                  containerIconTitle: "barbell",
                                  tag: Tag(tagTitle: "Personal",
                                           tagColor: Color(red: 0.51,
                                                           green: 0.51,
                                                           blue: 0.51,
                                                           alpha: 1)),
                                  tasks: [Task(taskTitle: "Workout",
                                               taskColor: Color(red: 1,
                                                                green: 0.649,
                                                                blue: 0.337,
                                                                alpha: 1))]))
        temp.append(TaskContainer(containerTitle: "Learn HTML & CSS",
                                  containerIconTitle: "code.slash",
                                  tag: Tag(tagTitle: "Personal",
                                           tagColor: Color(red: 0.51,
                                                           green: 0.51,
                                                           blue: 0.51,
                                                           alpha: 1)),
                                  tasks: [Task(taskTitle: "Coding",
                                               taskColor: Color(red: 0.992,
                                                                green: 0.357,
                                                                blue: 0.443,
                                                                alpha: 1))]))
        temp.append(TaskContainer(containerTitle: "Read 10 pages of book",
                                  containerIconTitle: "book",
                                  tag: Tag(tagTitle: "Personal",
                                           tagColor: Color(red: 0.51,
                                                           green: 0.51,
                                                           blue: 0.51,
                                                           alpha: 1)),
                                  tasks: [Task(taskTitle: "Reading",
                                               taskColor: Color(red: 0.029,
                                                                green: 0.879,
                                                                blue: 0.573,
                                                                alpha: 1))]))
        return temp
    }()
    private var today: TodayTasks
    public var todayTasks: TodayTasks {
        today
    }
    required init () {
        today = TodayTasks()
    }
    func fetchTasks() {
        for taskGroup in staticData {
            today.pushTaskGroup(taskGroup: taskGroup)
        }
    }
}
