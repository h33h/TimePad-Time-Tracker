//
//  ViewController.swift
//  TimePad-Time-Tracker
//
//  Created by xxx on 7.10.21.
//

import UIKit

class MainViewController: UIViewController {
    private let reuseIdentifire = String(describing: TaskGroupTableViewCell.self)
    var service: Service?
    @IBOutlet private var currentTaskView: UIView!
    @IBOutlet private var tableVeiw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTaskInit()
        tableViewInit()
    }
}

extension MainViewController {
    func currentTaskInit() {
        currentTaskView.layer.cornerRadius = 12
        children.forEach {
            if $0 is CurrentTaskVC {
                ($0 as? CurrentTaskVC)?.currentGroup = service?.todayTasks.currentTaskGroup
            }
        }
    }
    func tableViewInit() {
        tableVeiw.delegate = self
        tableVeiw.dataSource = self
        tableVeiw.register(
            UINib(nibName: reuseIdentifire, bundle: nil),
            forCellReuseIdentifier: reuseIdentifire
        )
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        service?.todayTasks.count ?? 0
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifire,
            for: indexPath
        ) as? TaskGroupTableViewCell
        guard let cell = cell, let service = service else { return UITableViewCell() }
        let taskGroup = service.todayTasks.taskGroups[indexPath.row]
        cell.color = taskGroup.currentTask?.color?.convertColor()
        cell.setIconOfGroup(iconTitle: taskGroup.icon)
        cell.tGroupLabel = taskGroup.title
        cell.tagLabel = taskGroup.tag?.title
        cell.tagColor = taskGroup.tag?.color?.convertColor()
        cell.currentTaskLabel = taskGroup.currentTask?.title
        cell.time = taskGroup.currentTask?.time.toString()
        return cell
    }
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
}
