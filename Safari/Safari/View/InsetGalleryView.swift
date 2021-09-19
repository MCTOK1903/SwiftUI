//
//  InsetGalleryView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - Properties

    let animal: Animal

    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .center, spacing: 15, content: {
                ForEach(animal.gallery!, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: Lop
            }) //: HStack
        }) //: ScrollView
    }
}

// MARK: - Preview

struct InsetGalleryView_Previews: PreviewProvider {

    static let animals : [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
