//
//  PokemonDetails.swift
//  API challenge
//
//  Created by User on 06/10/23.
//

import SwiftUI

struct PokemonDetails: View {
    let pokemon: PokemonEntry
    
    
    var body: some View {
        Text(pokemon.name)
        
    }
    
}
