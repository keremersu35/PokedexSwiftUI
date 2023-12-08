//
//  ContentView.swift
//  Pokedex
//
//  Created by Kerem Ersu on 8.12.2023.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            Image(Constants.logo.rawValue)
            LottieView(lottieFile: Constants.loading.rawValue, loopMode: .loop)
                .frame(width: .large, height: .large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.pokedexDarkBlue)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
