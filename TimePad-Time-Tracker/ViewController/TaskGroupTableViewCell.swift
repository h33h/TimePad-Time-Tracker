//
//  TaskGroupTableViewCell.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

class TaskGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var taskGroupLabel: UILabel!
    @IBOutlet weak var tagView: TagView!
    @IBOutlet weak var currentTaskTag: TagView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var iconOfGroup: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentsView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
