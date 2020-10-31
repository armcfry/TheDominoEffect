//
//  DominoCollectionViewCell.swift
//  The Domino Effect
//
//  Created by Adam McFry on 10/31/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class DominoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dominoImageView: UIImageView!
    
    func setCellImage(domino:Domino){
        dominoImageView.image = UIImage(named: domino.imageName)
    }
    
}
