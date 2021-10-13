//
//  TagView.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import UIKit

class TagView: UIView {

    override func draw(_ rect: CGRect) {
        let label = UILabel()
        label.text = "text"
        frame = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width + 16, height: rect.height + 10)
        label.center = center
        layer.cornerRadius = 6
    }
}
