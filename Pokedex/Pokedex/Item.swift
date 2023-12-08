//
//  Item.swift
//  Pokedex
//
//  Created by Kerem Ersu on 8.12.2023.
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
