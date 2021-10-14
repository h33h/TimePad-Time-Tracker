//
//  CircleView.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    @IBInspectable var startColor: UIColor? = .white
    @IBInspectable var endColor: UIColor? = .white
    @IBInspectable var lineWidth: CGFloat = 2
    @IBInspectable var fillColor: UIColor? = .white

    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .radial
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1.5, y: -0.5)
        return gradientLayer
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configure()
    }

    override func draw(_ rect: CGRect) {
        updateGradient()
    }
}

private extension CircleView {
    func configure() {
        layer.addSublayer(gradientLayer)
    }

    func updateGradient() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor, endColor].map { $0?.cgColor }

        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        if let fillColor = fillColor {
            fillColor.setFill()
            path.fill()
        }
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        gradientLayer.mask = mask
    }
}
