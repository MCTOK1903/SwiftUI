//
//  Fruit.swift
//  Fructus
//
//  Created by Celal Tok on 21.05.2021.
//

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
