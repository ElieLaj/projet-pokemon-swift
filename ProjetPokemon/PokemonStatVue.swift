//
//  PokemonStatVue.swift
//  ProjetPokemon
//
//  Created by SDV Bordeaux on 24/04/2025.
//

import SwiftUI

struct PokemonStatVue: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Information :")
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.headline)
            HStack {
                HStack {
                    Text("HP: ")
                    Text("68")
                }
                Spacer()
                HStack {
                    Text("Défense: ")
                    Text("21")
                }
            }.padding(.horizontal, 50)
            
            HStack {
                HStack {
                    Text("Attaque: ")
                    Text("43")
                }
                Spacer()
                HStack {
                    Text("Vitesse: ")
                    Text("29")
                }
            }.padding(.horizontal, 50)
                .padding(.top, 10)
        }
    }
}

#Preview {
    PokemonStatVue()
}
