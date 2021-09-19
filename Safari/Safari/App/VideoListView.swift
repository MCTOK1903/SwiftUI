//
//  VideoListView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - Properties

   @State var videos : [Video] = Bundle.main.decode("videos.json")

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - Body

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(
                        destination: VideoPlayerView(
                            videoSelected: video.id,
                            videoTitle: video.name
                        )
                    ) {
                        VideListItemView(video: video)
                            .padding(.vertical, 8)
                    } //: NavigationLink
                } //: Loop
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        } //: NavigationView
    }
}

// MARK: Preview

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
