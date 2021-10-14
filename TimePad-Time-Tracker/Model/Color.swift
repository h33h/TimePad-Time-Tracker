//
//  Color.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import UIKit

public struct Color {
    var red: Float
    var green: Float
    var blue: Float
    var alpha: Float
    func convertColor() -> UIColor {
        UIColor(red: CGFloat(self.red), green: CGFloat(self.green), blue: CGFloat(self.blue), alpha: CGFloat(self.alpha))
    }
}
