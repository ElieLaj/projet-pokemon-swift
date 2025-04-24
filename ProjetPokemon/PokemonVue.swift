//
//  PokemonVue.swift
//  ProjetPokemon
//
//  Created by SDV Bordeaux on 24/04/2025.
//

import SwiftUI

struct PokemonVue: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        VStack {
            if let pokemon = viewModel.pokemon {
                AsyncImage(url: URL(string: pokemon.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .scaledToFit()
                             .frame(width: 200, height: 200)
                    case .failure:
                        Text("Image non disponible")
                    @unknown default:
                        Text("Erreur inconnue")
                    }
                }
                Text(pokemon.name)
                    .font(.title)
                    .fontWeight(.bold)
            } else {
                Text("Chargement...")
                    .onAppear {
                        viewModel.fetchPokemon()
                    }
            }
        }
        .padding()
    }
}

#Preview {
    PokemonVue()
}
