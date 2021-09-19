//
//  VideoPlayerView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - Properties

    // MARK: - Body

    var body: some View {
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "cheetah", withExtension: "mp4")!))
    }
}

// MARK: - Preview

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
