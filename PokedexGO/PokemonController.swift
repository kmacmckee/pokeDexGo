//
//  PokemonController.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/18/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
import UIKit

class PokemonController {
    
    var pokemons: [Pokemon] = []
    
    init() {
        getPokemon()
    }
    
    func getPokemon() {
        
        let mainBundle = Bundle.main
        let fileURL = mainBundle.url(forResource: "pokemon", withExtension: "json")!
        
        do {
            let json = try Data(contentsOf: fileURL)
            let pokemonResults = try JSONDecoder().decode([Pokemon].self, from: json)
            pokemons = pokemonResults
        } catch {
            NSLog("Error decoding Pokemon: \(error)")
        }
        
    }
    
    
    
    func getTypeColor(pokemon: Pokemon) -> [UIColor]? {
        
        let types = pokemon.types.compactMap { $0.name }
        var colors: [UIColor] = []
        for type in types {
            if type == "Bug" {
                colors.append(UIColor(hue: 0.1861, saturation: 1, brightness: 0.95, alpha: 1.0))
            }
            if type == "Dark" {
                colors.append(UIColor(red: 2 / 255, green: 11 / 255, blue: 17 / 255, alpha: 0.85))
            }
            if type == "Dragon" {
                colors.append(.purple)
            }
            if type == "Electric" {
                colors.append(.yellow)
            }
            if type == "Fairy" {
                colors.append(UIColor(hue: 0.8278, saturation: 0.52, brightness: 0.99, alpha: 1.0))
            }
            if type == "Fighting" {
                colors.append(UIColor(hue: 0.975, saturation: 1, brightness: 0.72, alpha: 1.0))
            }
            if type == "Fire" {
                colors.append(UIColor(hue: 0.0389, saturation: 1, brightness: 0.97, alpha: 1.0) )
            }
            if type == "Flying" {
                colors.append(UIColor(hue: 0.6583, saturation: 0.43, brightness: 0.93, alpha: 1.0) )
            }
            if type == "Ghost" {
                colors.append(UIColor(hue: 0.7583, saturation: 1, brightness: 0.76, alpha: 1.0) )
            }
            if type == "Grass" {
                colors.append(UIColor(hue: 0.3417, saturation: 1, brightness: 0.69, alpha: 1.0) )
            }
            if type == "Ground" {
                colors.append(UIColor(hue: 0.2056, saturation: 1, brightness: 0.31, alpha: 1.0) )
            }
            if type == "Ice" {
                colors.append(UIColor(hue: 0.5, saturation: 1, brightness: 0.79, alpha: 1.0) )
            }
            if type == "Normal" {
                colors.append(UIColor(red: 244 / 255, green: 226 / 244, blue: 144 / 255, alpha: 0.85))
            }
            if type == "Poison" {
                colors.append(UIColor(hue: 0.7917, saturation: 1, brightness: 0.29, alpha: 1.0) )
            }
            if type == "Psychic" {
                colors.append(UIColor(hue: 0.9306, saturation: 1, brightness: 0.99, alpha: 1.0) )
            }
            if type == "Rock" {
                colors.append(UIColor(red: 145 / 255, green: 154 / 255, blue: 132 / 255, alpha: 1))
            }
            if type == "Steel" {
                colors.append(UIColor(red: 105 / 255, green: 113 / 255, blue: 122 / 255, alpha: 1) )
            }
            if type == "Water" {
                colors.append(UIColor(hue: 0.6667, saturation: 1, brightness: 0.86, alpha: 1.0) )
            }
        }
    
        return colors
    }
  
}
