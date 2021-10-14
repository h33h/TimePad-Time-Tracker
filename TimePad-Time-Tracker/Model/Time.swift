//
//  Structures.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public struct Time {
    var hours: Int
    var minutes: Int
    var seconds: Int
    func toSeconds() -> Int {
        (self.hours * 60 * 60) + (minutes * 60) + seconds
    }
    func toString() -> String {
        "\(String(format: "%.2d", hours)):\(String(format: "%.2d", minutes)):\(String(format: "%.2d", seconds))"
    }
}
