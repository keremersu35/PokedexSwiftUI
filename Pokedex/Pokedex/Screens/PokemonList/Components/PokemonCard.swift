//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Kerem Ersu on 9.12.2023.
//

import SwiftUI

struct PokemonCard: View {
    var id: Int
    var name: String
    var imageUrl: String
    @State var averageColor: Color = .clear
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: .small) {
                Text("#\(id)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(name.capitalizeFirstLetter())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.all, .xsmall)
            AsyncImage(url: URL(string: imageUrl)) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                  } placeholder: {
                      Color.clear
                  }
                  .frame(width: 100, height: 100)
            Spacer()
                .frame(width: .small)
            Image(systemName: Constants.star.rawValue)
                .foregroundColor(.white)
        }
        .padding()
        .background(LinearGradient(colors: [averageColor, averageColor.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(12)
        .onAppear {
            Task {
                averageColor = await setAverageColor()
            }
        }
    }
    
    private func setAverageColor() async -> Color {
        var color: UIColor?
        color = UIImage(data: try! Data(contentsOf: URL(string: imageUrl)!))!.findAverageColor() ?? .clear
        return Color(uiColor: color!)
    }
}

#Preview {
    PokemonCard(id: 4, name: "Pokemon", imageUrl: "")
}

