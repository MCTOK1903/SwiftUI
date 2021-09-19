//
//  GalleryView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct GalleryView: View {

    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: String = "lion"
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3.0


    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColum))
    }
    // MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 30) {

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2)
                    )


                Slider(value: $gridColum, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum, perform: { value in
                        gridSwitch()
                    })


                LazyVGrid(
                    columns: gridLayout,
                    alignment: .center,
                    spacing: 10, content: {
                        ForEach(animals) { animal in
                            Image(animal.image!)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedAnimal = animal.image!
                                }
                        } //: ForEach
                }) //: LazyVGrid
                    .animation(.easeIn)
                    .onAppear(perform: {
                        gridSwitch()
                    })
            } //: VStack
            .padding(.vertical, 30)
            .padding(.horizontal, 10)
        }) //: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - Preview

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
