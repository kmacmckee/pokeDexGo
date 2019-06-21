//
//  PokemonTypeIconTableViewCell.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/21/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonTypeIconTableViewCell: UITableViewCell {

    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    var pokemonController: PokemonController?
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var type2ImageView: UIImageView!
    @IBOutlet weak var type1ImageView: UIImageView!
    
    
    
    func updateViews() {
        guard let pokemon = pokemon,
            let icons = pokemonController?.getTypeIcon(pokemon: pokemon) else { return }
        
        pokemonNameLabel.text = pokemon.name
        type1ImageView.image = icons.first
        
        if icons.count > 1 {
            type2ImageView.image = icons.last
        }
        
        
        
    }
}
