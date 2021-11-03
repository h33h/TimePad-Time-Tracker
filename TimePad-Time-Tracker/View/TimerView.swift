//
//  TimerView.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 15.10.21.
//

import UIKit

class TimerView: UIView {
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: -0.7)
        return gradientLayer
    }()
    private var endAngle = 0.0
    func setAngle(seconds: Int) {
        endAngle = (-.pi / 2) + (Double(seconds) / (2 * .pi) / 90)
    }
    override func draw(_ rect: CGRect) {
        gradientLayer.colors = [UIColor(red: 0.44, green: 0.07, blue: 0.81, alpha: 1), UIColor.white].compactMap { $0?.cgColor }
        let backgroundPath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                          radius: rect.width / 2 - 24,
                                          startAngle: 0,
                                          endAngle: 2 * .pi,
                                          clockwise: true)
        let lineBackround = CAShapeLayer()
        lineBackround.path = backgroundPath.cgPath
        lineBackround.fillColor = UIColor.clear.cgColor
        lineBackround.strokeColor = UIColor(red: 0.913, green: 0.913, blue: 1, alpha: 1).cgColor
        lineBackround.lineWidth = 24
        let timePath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                    radius: rect.width / 2 - 24,
                                    startAngle: -.pi / 2,
                                    endAngle: endAngle,
                                    clockwise: true)
        let timeLayer = CAShapeLayer()
        timeLayer.path = timePath.cgPath
        timeLayer.lineCap = .round
        timeLayer.fillColor = UIColor.clear.cgColor
        timeLayer.strokeColor = UIColor.white.cgColor
        timeLayer.lineWidth = 24.0
        gradientLayer.frame = rect
        gradientLayer.mask = timeLayer
        self.layer.addSublayer(lineBackround)
        self.layer.addSublayer(gradientLayer)
    }
}
