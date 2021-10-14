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
    @IBOutlet var currentTaskView: UIView!
    @IBOutlet var tableVeiw: UITableView!
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
        let taskGroup = service.todayTasks.taskGroups[indexPath.row]
        cell?.circleView.startColor = taskGroup.currentTask?.color?.convertColor()
        cell?.circleView.endColor = taskGroup.currentTask?.color?.convertColor()
        cell?.circleView.fillColor = taskGroup.currentTask?.color?.convertColor()
        cell?.iconOfGroup.image = UIImage(named: taskGroup.icon)
        cell?.iconOfGroup.tintColor = .white
        cell?.taskGroupLabel.text = taskGroup.title
        cell?.tagView.text = taskGroup.tag?.title
        cell?.tagView.textColor = taskGroup.tag?.color?.convertColor()
        cell?.currentTaskTag.text = taskGroup.currentTask?.title
        cell?.currentTaskTag.textColor = taskGroup.currentTask?.color?.convertColor()
        cell?.timeLabel.text = taskGroup.currentTask?.time.toString()
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
