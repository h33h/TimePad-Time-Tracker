//
//  DiagramView.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 16.10.21.
//

import UIKit

class DiagramView: UIView {
    var durationStack: UIStackView?
    var timeStack: UIStackView?
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.colors = [
            UIColor(red: 233 / 255, green: 233 / 255, blue: 1, alpha: 1),
            UIColor(red: 233 / 255, green: 233 / 255, blue: 1, alpha: 0.25)
        ].compactMap { $0?.cgColor }
        return gradientLayer
    }()
    override func draw(_ rect: CGRect) {
        let shapeLayer = CAShapeLayer()
            shapeLayer.strokeColor = UIColor.black.withAlphaComponent(0.1).cgColor
            shapeLayer.lineWidth = 2
            shapeLayer.fillColor = .none
            shapeLayer.lineDashPattern = [15, 10]
        let path = CGMutablePath()
        guard let durationStack = durationStack else {
            return
        }
        for duration in durationStack.arrangedSubviews {

            path.addLines(between: [CGPoint(x: 0, y: duration.frame.minY),
                                    CGPoint(x: bounds.width, y: duration.frame.minY)])
        }
        shapeLayer.path = path
        let colomnShapeLayer = CAShapeLayer()
        colomnShapeLayer.fillColor = UIColor.white.cgColor
        guard let am10 = (timeStack?.arrangedSubviews[2] as? UILabel) else { return }
        let colomnPath = UIBezierPath(roundedRect:
                                        CGRect(x: am10.frame.maxX, y: 0, width: 44, height: durationStack.arrangedSubviews.last?.frame.minY ?? 0),
                                      byRoundingCorners: [.topLeft, .topRight],
                                      cornerRadii: CGSize(width: 8, height: 8)
        )
        colomnShapeLayer.path = colomnPath.cgPath
        gradientLayer.frame = rect
        gradientLayer.mask = colomnShapeLayer
        let verticalLine = CGMutablePath()
        verticalLine.addLines(between: [
            CGPoint(x: am10.frame.maxX + 22, y: 0),
            CGPoint(x: am10.frame.maxX + 22, y: durationStack.arrangedSubviews.last?.frame.minY ?? 0)
        ])
        let verticalLineLayer = CAShapeLayer()
        verticalLineLayer.strokeColor = UIColor.white.cgColor
        verticalLineLayer.lineWidth = 2
        verticalLineLayer.fillColor = .none
        verticalLineLayer.lineDashPattern = [15, 10]
        verticalLineLayer.path = verticalLine
        let circlePath = UIBezierPath(ovalIn:
                                        CGRect(x: am10.frame.maxX + 13,
                                               y: durationStack.arrangedSubviews[1].frame.midY,
                                               width: 24 - 7,
                                               height: 24 - 7))
        let circleLayer = CAShapeLayer()
        circleLayer.strokeColor = UIColor(red: 155 / 255, green: 81 / 255, blue: 224 / 255, alpha: 1).cgColor
        circleLayer.fillColor = UIColor.white.cgColor
        circleLayer.lineWidth = 7
        circleLayer.path = circlePath.cgPath
        layer.addSublayer(shapeLayer)
        layer.addSublayer(gradientLayer)
        layer.addSublayer(verticalLineLayer)
        layer.addSublayer(circleLayer)
    }
}
