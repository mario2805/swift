//
//  ContentView.swift
//  API challenge
//
//  Created by User on 06/10/23.
//
// O código acabou ficando incompleto, por conta da falta de tempo e claro minha propria culpa, que eu assumo, pois acabei não entendendo muito o explicado na última aula e por isso precisei de um vídeo como guia.



import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    
                    HStack{
                        PokemonImages(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized,
                                       destination: PokemonDetails(pokemon: entry))
                    }
                    
                }
                
            }
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
        
        .padding()
        .onAppear {
            PokemonSelectedApi().getData(url: "https://pokeapi.co/api/v2/pokemon/2/") { url in
                print(url)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
