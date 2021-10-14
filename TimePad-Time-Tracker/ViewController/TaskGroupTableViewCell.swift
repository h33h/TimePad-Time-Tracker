//
//  TaskGroupTableViewCell.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class TaskGroupTableViewCell: UITableViewCell {
    var color: UIColor? {
        get {
            circleView.startColor
        }
        set {
            circleView.startColor = newValue
            circleView.endColor = newValue
            circleView.fillColor = newValue
            currentTaskTag.textColor = newValue
        }
    }
    var tGroupLabel: String? {
        get {
            taskGroupLabel.text
        }
        set {
            taskGroupLabel.text = newValue
        }
    }
    var tagLabel: String? {
        get {
            tagView.text
        }
        set {
            tagView.text = newValue
        }
    }
    var tagColor: UIColor? {
        get {
            tagView.textColor
        }
        set {
            tagView.textColor = newValue
        }
    }
    var currentTaskLabel: String? {
        get {
            currentTaskTag.text
        }
        set {
            currentTaskTag.text = newValue
        }
    }
    var time: String? {
        get {
            timeLabel.text
        }
        set {
            timeLabel.text = newValue
        }
    }
    @IBOutlet private var circleView: CircleView!
    @IBOutlet private var taskGroupLabel: UILabel!
    @IBOutlet private var tagView: TagView!
    @IBOutlet private var currentTaskTag: TagView!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var contentsView: UIView!
    @IBOutlet private var iconOfGroup: UIImageView!
    func setIconOfGroup(iconTitle: String) {
        iconOfGroup.image = UIImage(named: iconTitle)
        iconOfGroup.tintColor = .white
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        contentsView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
