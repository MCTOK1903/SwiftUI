//
//  AnimalDetailView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties

    let animal: Animal

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20) {
                // Hero image

                Image(animal.image!)
                    .resizable()
                    .scaledToFit()

                // Title

                Text(animal.name!.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height:6)
                            .offset(y:24)
                    )

                // HeadLine

                Text(animal.headline!)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)

                // Gallery

                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled",
                                headingText: "Willderness in Pictures")

                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                // facts

                // description

                // map

                // link

            } //: VStack
            .navigationBarTitle("Learn About  \(animal.name!)", displayMode: .inline)
        })  //: ScrollView
    }
}

// MARK: - Preview

struct AnimalDetailView_Previews: PreviewProvider {

    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[1])
        }
    }
}
