//
//  Video.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
