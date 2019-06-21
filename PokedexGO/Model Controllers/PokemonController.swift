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
                colors.append(AppearanceHelper.bugColor)
            }
            if type == "Dark" {
                colors.append(AppearanceHelper.darkColor)
            }
            if type == "Dragon" {
                colors.append(AppearanceHelper.dragonColor)
            }
            if type == "Electric" {
                colors.append(AppearanceHelper.electricColor)
            }
            if type == "Fairy" {
                colors.append(AppearanceHelper.fairyColor)
            }
            if type == "Fighting" {
                colors.append(AppearanceHelper.fightingColor)
            }
            if type == "Fire" {
                colors.append(AppearanceHelper.fireColor)
            }
            if type == "Flying" {
                colors.append(AppearanceHelper.flyingColor)
            }
            if type == "Ghost" {
                colors.append(AppearanceHelper.ghostColor)
            }
            if type == "Grass" {
                colors.append(AppearanceHelper.grassColor)
            }
            if type == "Ground" {
                colors.append(AppearanceHelper.groundColor)
            }
            if type == "Ice" {
                colors.append(AppearanceHelper.iceColor)
            }
            if type == "Normal" {
                colors.append(AppearanceHelper.normalColor)
            }
            if type == "Poison" {
                colors.append(AppearanceHelper.poisonColor)
            }
            if type == "Psychic" {
                colors.append(AppearanceHelper.psychicColor)
            }
            if type == "Rock" {
                colors.append(AppearanceHelper.rockColor)
            }
            if type == "Steel" {
                colors.append(AppearanceHelper.steelColor)
            }
            if type == "Water" {
                colors.append(AppearanceHelper.waterColor )
            }
        }
    
        return colors
    }
    
    
    func getTypeIcon(pokemon: Pokemon) -> [UIImage]? {
        
        let types = pokemon.types.compactMap { $0.name }
        var icons: [UIImage] = []
        for type in types {
            if type == "Bug" {
                icons.append(AppearanceHelper.bugIcon)
            }
            if type == "Dark" {
                icons.append(AppearanceHelper.darkIcon)
            }
            if type == "Dragon" {
                icons.append(AppearanceHelper.dragonIcon)
            }
            if type == "Electric" {
                icons.append(AppearanceHelper.electricIcon)
            }
            if type == "Fairy" {
                icons.append(AppearanceHelper.fairyIcon)
            }
            if type == "Fighting" {
                icons.append(AppearanceHelper.fightingIcon)
            }
            if type == "Fire" {
                icons.append(AppearanceHelper.fireIcon)
            }
            if type == "Flying" {
                icons.append(AppearanceHelper.flyingIcon)
            }
            if type == "Ghost" {
                icons.append(AppearanceHelper.ghostIcon)
            }
            if type == "Grass" {
                icons.append(AppearanceHelper.grassIcon)
            }
            if type == "Ground" {
                icons.append(AppearanceHelper.groundIcon)
            }
            if type == "Ice" {
                icons.append(AppearanceHelper.iceIcon)
            }
            if type == "Normal" {
                icons.append(AppearanceHelper.normalIcon)
            }
            if type == "Poison" {
                icons.append(AppearanceHelper.poisonIcon)
            }
            if type == "Psychic" {
                icons.append(AppearanceHelper.psychicIcon)
            }
            if type == "Rock" {
                icons.append(AppearanceHelper.rockIcon)
            }
            if type == "Steel" {
                icons.append(AppearanceHelper.steelIcon)
            }
            if type == "Water" {
                icons.append(AppearanceHelper.waterIcon )
            }
        }
        
        return icons
    }
    
    
    
    
    
    func formatQuickMove(move: String) -> String {

        let moveString = move
        var moveStringArray = moveString.split(separator: " ")
        moveStringArray.removeLast()
        let formattedMove = moveStringArray.joined(separator: " ")
        return formattedMove
        
    }
    
    
    
    
  
}
