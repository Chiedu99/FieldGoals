//
//  Player.swift
//  TextFileCSV
//
//  Created by Cheidu on 3/7/17.
//  Copyright © 2017 Cheidu. All rights reserved.
//  This file defines key things such as the intance of a player, their names, and their data

import Foundation

class Player {
    // define the name and data of the player as a string and float respectively
    let name: String
    let data: [Float]
    
    // creates the instance of both name and data
    init(name: String, data: [Float]) {
        self.name = name
        self.data = data
    }
    
}
