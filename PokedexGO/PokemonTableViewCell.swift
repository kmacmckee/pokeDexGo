//
//  PokemonTableViewCell.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/18/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    var pokemonController: PokemonController?
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    var typeColors: [UIColor]? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type1View: UIView!
    @IBOutlet weak var type2Label: UILabel!
    @IBOutlet weak var type2View: UIView!
    
    func updateViews() {
        guard let pokemon = pokemon,
            let typeColors = typeColors,
            let textColors = pokemonController?.getTextColor(pokemon: pokemon) else {return }
        
        
        pokemonLabel.text = pokemon.name
        
        type1Label.text = pokemon.types.first?.name
        type1Label.textColor = textColors.first
        type1View.backgroundColor = typeColors.first
        
        if pokemon.types.count > 1 {
            type2Label.text = pokemon.types.last?.name
            type2Label.textColor = textColors.last
            type2View.backgroundColor = typeColors.last
        } else {
            type2View.backgroundColor = typeColors.first
            type2Label.text = ""
        }


        
    }
    

    
    
}
