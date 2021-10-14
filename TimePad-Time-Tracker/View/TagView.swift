//
//  TagView.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import UIKit

@IBDesignable
class TagView: UILabel {
    override var textColor: UIColor? {
        didSet {
            backgroundColor = textColor?.withAlphaComponent(0.1)
        }
    }
    override func layoutSubviews() {
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width + 8, height: frame.size.height + 5)
        textAlignment = .center
        clipsToBounds = true
        layer.cornerRadius = 6
    }
}
