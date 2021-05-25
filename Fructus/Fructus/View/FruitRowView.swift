//
//  FruitRowView.swift
//  Fructus
//
//  Created by Celal Tok on 25.05.2021.
//

import SwiftUI

struct FruitRowView: View {
    // MARK: - Properties
    
    var fruit: Fruit
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 70, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }) //: VStack
        } //: HStack
    }
}

// MARK: - Preview
struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
