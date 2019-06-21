//
//  Pokemon.swift
//  PokedexGO
//
//  Created by Kobe McKee on 6/18/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    var dex: Int
    var name: String
    var maxCP: Int
    var cinematicMoves: [Move]
    var quickMoves: [Move]
    var types: [Type]

}

struct Move: Codable {
    var name: String
}

struct Type: Codable {
    var name: String
}

