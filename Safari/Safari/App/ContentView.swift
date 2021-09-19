//
//  ContentView.swift
//  Safari
//
//  Created by MCT on 19.09.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties

    let animals : [Animal] = Bundle.main.decode("animals.json")

    @State private var isGridViewActive: Bool = false

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"

    // MARK: - Func

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColum = gridLayout.count

        switch gridColum {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }

    // MARK: - Body

    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    mainPageList()
                } else {
                    mainGridView()
                } //: Condition
            } //: Group
            .navigationBarTitle("Africa",
                                displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //ListButton
                        Button(action: {
                            isGridViewActive = false
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })

                        //GridButton
                        Button(action: {
                            isGridViewActive = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })

                    } //: HStack
                } //: ToolbarItem
            } //: toolbar
        } //: Navihation
    }


    func mainPageList() -> some View {
        return List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(
                            EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0
                            )
                        )

                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalaListItemView(animal: animal)
                    } //: NavigationLink
                } //: ForEach
            } //: List
    }

    func mainGridView() -> some View {
        return ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGrid(
                    columns: gridLayout,
                    alignment: .center,
                    spacing: 10, content: {
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalGridItemView(animal: animal)
                                }) //: NavigationLink
                        } //: ForEach
                    }) //: LazyVGrid
                    .padding(10)
                    .animation(.easeIn)
            }) //: ScrollView
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
