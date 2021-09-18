//
//  CodableBundleExtension.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {

        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else{
            fatalError("Failed to locate \(file) in bundle")
        }

        return loaded
    }
}
