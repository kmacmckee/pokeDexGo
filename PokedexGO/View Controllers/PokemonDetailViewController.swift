//
//  PokemonDetailViewController.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/18/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var pokemonController: PokemonController?
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var moveTableView: UITableView!
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type2Label: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var maxCPLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moveTableView.register(MoveTableViewCell.self, forCellReuseIdentifier: "MoveCell")
        moveTableView.backgroundColor = .clear
        updateViews()
        moveTableView.delegate = self
        moveTableView.dataSource = self
        
        guard let pokemon = pokemon else { return }
        
        self.title = pokemon.name.capitalized
        guard let typeColors = pokemonController?.getTypeColor(pokemon: pokemon) else { return }
        
        if typeColors.count > 1 {
            let gradient = CAGradientLayer()
            gradient.colors = typeColors.compactMap { $0.cgColor }
            gradient.frame = view.bounds
            view.layer.insertSublayer(gradient, at: 0)
        } else {
            let gradient = CAGradientLayer()
            gradient.colors = [typeColors.first?.cgColor, UIColor(named: "white")?.cgColor]
            gradient.frame = view.bounds
            view.layer.insertSublayer(gradient, at: 0)
            

        }

    }
    
    
    func updateViews() {
        guard isViewLoaded else { return }
        guard let pokemon = pokemon,
            let typeColors = pokemonController?.getTypeColor(pokemon: pokemon) else { return }
        
        pokemonNameLabel.text = pokemon.name.capitalized
        typeLabel.text = pokemon.types.first?.name
        typeLabel.backgroundColor = typeColors.first
        
        type1Label.text = pokemon.types.first?.name
        type1Label.backgroundColor = typeColors.first
        
        
        type2Label.text = pokemon.types.last?.name
        type2Label.backgroundColor = typeColors.last
        
        if pokemon.types.count > 1 {
            typeLabel.isHidden = true
            type1Label.isHidden = false
            type2Label.isHidden = false
        } else {
            typeLabel.isHidden = false
            type1Label.isHidden = true
            type2Label.isHidden = true
        }
        
        maxCPLabel.text = ("Max CP: \(pokemon.maxCP)")
        
    
    }
    
    
    func moveFor(indexPath: IndexPath) -> Move? {
        if indexPath.section == 0 {
            guard let move = pokemon?.quickMoves[indexPath.row] else { return nil }
            var updatedMove = move
            let formattedMoveName = pokemonController?.formatQuickMove(move: move.name)
            updatedMove.name = formattedMoveName!
            return updatedMove
        } else {
            return pokemon?.cinematicMoves[indexPath.row]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Quick Moves"
        } else {
            return "Charged Moves"
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return pokemon?.quickMoves.count ?? 0
        default:
            return pokemon?.cinematicMoves.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moveTableView.dequeueReusableCell(withIdentifier: "MoveCell", for: indexPath) as! MoveTableViewCell
        
        let move = moveFor(indexPath: indexPath)
        cell.textLabel?.text = move?.name
        cell.backgroundColor = UIColor(red: 232 / 255, green: 238 / 255, blue: 255 / 255, alpha: 0.3)
        
        
        
        return cell
    }

    
    func getTypeEffectiveness() {
    
    }

}
