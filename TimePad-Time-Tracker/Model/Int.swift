//
//  Extensions.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 14.10.21.
//

import Foundation

extension Int {
    func secondsToHoursMinutesSeconds() -> Time {
        Time(hours: self / 3600, minutes: self % 3600 / 60, seconds: self % 3600 % 60)
    }
}
