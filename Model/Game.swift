//
//  Game.swift
//  Bullseye
//
//  Created by BankNeo on 2021/05/06.
//

import Foundation

struct Game{
    var target: Int = 42
    var score: Int = 0
    var round: Int = 1

    func point(sliderValue: Int) -> Int {
        return 20
    }
    
}
