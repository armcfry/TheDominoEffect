//
//  DominoManager.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/30/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import Foundation

class DominoManager {
    
    //2D array of dominos to keep up with the selection status of each domino
    var dominos:[[Domino]] = [[]]
        
    static let shared = DominoManager()
    
    func initializeDominos()
    {
        for _ in 0..<9 {
            var temp = [Domino]()
            for _ in 0..<9 {
                temp.append(Domino(head : 0,tail : 0, isSelected :false, imageName:""))
            }
            dominos.append(temp)
        }
        print(dominos.count)
        print(dominos[9])
    }
    //Initializer access level change now
    private init(){}
    
}
