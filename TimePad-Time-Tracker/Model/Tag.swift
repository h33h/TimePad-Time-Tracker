//
//  Tag.swift
//  TimePad-Time-Tracker
//
//  Created by XXX on 10.10.21.
//

import Foundation

public protocol TagProtocol {
    var title: String { get set }
    var color: Color? { get }
}

public final class Tag: TagProtocol {
    private var tagColor: Color?
    public var title: String
    public var color: Color? {
        tagColor
    }
    required init (tagTitle title: String, tagColor color: Color?) {
        self.title = title
        self.tagColor = color
    }
    convenience init (tagTitle title: String) {
        self.init(tagTitle: title, tagColor: nil)
    }
    convenience init() {
        self.init(tagTitle: "")
    }
}
