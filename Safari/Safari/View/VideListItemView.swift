//
//  VideListItem.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct VideListItemView: View {
    // MARK: - Properties

    let video: Video

    // MARK: - Body

    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)

                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZStack

            VStack(alignment: .leading, spacing: 10, content: {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)

                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }) //:VStack
        }) //: HStack
    }
}

// MARK: - Preview

struct VideListItem_Previews: PreviewProvider {

    static let videos : [Video] = Bundle.main.decode("videos.json")

    static var previews: some View {
        VideListItemView(video: videos[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
