//
//  PokemonDetailViewController.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/18/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var pokemonController: PokemonController?
    var pokemon: Pokemon?

    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemon = pokemon else { return }
        
        self.title = pokemon.name.capitalized
        guard let typeColors = pokemonController?.getTypeColor(pokemon: pokemon) else { return }
        
        if typeColors.count > 1 {
            let gradient = CAGradientLayer()
            gradient.colors = typeColors.compactMap { $0.cgColor }
            //gradient.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
            gradient.frame = view.bounds
            view.layer.insertSublayer(gradient, at: 0)
        } else {
            let gradient = CAGradientLayer()
            gradient.colors = [typeColors.first?.cgColor, UIColor(named: "white")?.cgColor]
            //gradient.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
            gradient.frame = view.bounds
            view.layer.insertSublayer(gradient, at: 0)
        }

    }


}
