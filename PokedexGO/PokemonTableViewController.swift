//
//  PokemonTableViewController.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/18/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {

    let pokemonController = PokemonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonController.pokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        cell.pokemonController = pokemonController

        let pokemon = pokemonController.pokemons[indexPath.row]
        let typeColors = pokemonController.getTypeColor(pokemon: pokemon)
        cell.pokemon = pokemon
        cell.typeColors = typeColors
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailSegue" {
            let detailVC = segue.destination as! PokemonDetailViewController
            detailVC.pokemonController = pokemonController
            if let index = tableView.indexPathForSelectedRow {
                detailVC.pokemon = pokemonController.pokemons[index.row]
            }
            
        }
    }
        

}
