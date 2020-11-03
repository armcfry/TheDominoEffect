//
//  SelectCollectionViewCell.swift
//  The Domino Effect
//
//  Created by Adam McFry on 11/2/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dominoButton: UIButton!
    
    func setCellImage(imgName:String){
        dominoButton.setImage(UIImage(named: imgName), for: .normal)
    }

    func setCellTag(tag:Int){
        dominoButton.tag = tag
    }
}
