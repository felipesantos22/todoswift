//
//  Item.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
