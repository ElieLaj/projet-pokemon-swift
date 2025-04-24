//
//  Pokemon.swift
//  ProjetPokemon
//
//  Created by SDV Bordeaux on 24/04/2025.
//

import SwiftUI

struct Pokemon: Identifiable, Decodable {
    var id: Int
    var name: String
    var image: String
    var sprite: String
}

