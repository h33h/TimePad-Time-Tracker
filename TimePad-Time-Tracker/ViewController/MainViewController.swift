//
//  ViewController.swift
//  TimePad-Time-Tracker
//
//  Created by xxx on 7.10.21.
//

import UIKit

class MainViewController: UIViewController {
    private var service = Service()
    private let reuseIdentifire = String(describing: TaskGroupTableViewCell.self)
    @IBOutlet private var currentTaskView: UIView!
    @IBOutlet private var tableVeiw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTaskView.layer.cornerRadius = 12
        service.fetchTasks()
        children.forEach {
            if $0 is CurrentTaskVC {
                ($0 as? CurrentTaskVC)?.currentTask = service.todayTasks.currentTaskGroup?.currentTask
            }
        }
        tableVeiw.delegate = self
        tableVeiw.dataSource = self
        tableVeiw.register(UINib(nibName: reuseIdentifire, bundle: nil), forCellReuseIdentifier: reuseIdentifire)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service.todayTasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as? TaskGroupTableViewCell
        guard let cell = cell else { return UITableViewCell() }
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
