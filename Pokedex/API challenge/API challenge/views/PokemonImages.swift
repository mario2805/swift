//
//  PokemonImages.swift
//  API challenge
//
//  Created by User on 06/10/23.
//

import SwiftUI

struct PokemonImages: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear{
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print("New url!!! Caching...")
                } else {
                    getSprite(url: loadedData!)
                    print("Using cached url...")
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
        
    }
    func getSprite(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getData(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
    
}

struct PokemonImages_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImages()
    }
}
