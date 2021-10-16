//
//  TagView.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import UIKit

@IBDesignable
class TagView: UILabel {
    let layerShape = CAShapeLayer()
    override var textColor: UIColor? {
        didSet {
            layerShape.fillColor = textColor?.withAlphaComponent(0.1).cgColor
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    override func layoutSubviews() {
        layerShape.path = UIBezierPath(
            roundedRect: CGRect(
                x: bounds.origin.x - 8,
                y: bounds.origin.y - 5,
                width: bounds.size.width + 16,
                height: bounds.size.height + 10),
            cornerRadius: 6).cgPath
    }
    func initialize() {
        textAlignment = .center
        layer.addSublayer(layerShape)
    }
}
