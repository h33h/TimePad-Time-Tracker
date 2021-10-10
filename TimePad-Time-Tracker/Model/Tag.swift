//
//  Tag.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public protocol TagProtocol {
    var title: String { get set }
    var color: Color { get }
}

public final class Tag: TagProtocol {
    private var tagColor: Color
    private var backgroundColor: Color
    public var title: String
    public var color: Color {
        tagColor
    }
    required init (tagTitle title: String, tagColor color: Color) {
        self.title = title
        self.tagColor = color
        self.backgroundColor = Color(red: color.red, green: color.green, blue: color.blue, alpha: 0.7)
    }
    convenience init (tagTitle title: String) {
        self.init(tagTitle: title, tagColor: Color(red: 0.51, green: 0.51, blue: 0.51, alpha: 1))
    }
}

extension Double {
    func secondsToHoursMinutesSeconds() -> Time {
        Time(hours: Int(self) / 3600, minutes: (Int(self) % 3600) / 60, seconds: (Int(self) % 3600) % 60)
    }
}
