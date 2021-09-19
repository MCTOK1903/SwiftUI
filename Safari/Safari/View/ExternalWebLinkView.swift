//
//  ExternalWebLinkView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - Properties

    var animal: Animal

    // MARK: - Body

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")

                    Link(animal.name!, destination: URL(string: animal.link!)!)
                } //: Group
                .foregroundColor(.accentColor)
            } //: HStack
        }//: Box
    }
}

// MARK: Preview

struct ExternalWebLinkView_Previews: PreviewProvider {

    static let animals : [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWebLinkView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
