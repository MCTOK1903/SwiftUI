//
//  HeadingView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct HeadingView: View {

    // MARK: - Properties

    var headingImage: String
    var headingText: String

    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

// MARK: - Preview

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "asdkljasdja")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
