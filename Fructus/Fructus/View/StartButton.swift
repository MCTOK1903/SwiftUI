//
//  StartButton.swift
//  Fructus
//
//  Created by Celal Tok on 20.05.2021.
//

import SwiftUI

struct StartButton: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            print("sa")
        }, label: {
            HStack (spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                Capsule().stroke(Color.white, lineWidth: 1.25)
            )
        }) // Button
        .accentColor(.white)
    }
}

//MARK: - PREVIEW

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
