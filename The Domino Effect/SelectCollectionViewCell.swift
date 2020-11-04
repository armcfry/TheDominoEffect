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
        let thisBImage = "\(imgName)\(dominoButton.tag).png"
        dominoButton.setImage(UIImage(named: thisBImage), for: .normal)
    }

    func setCellTag(tag:Int){
        dominoButton.tag = tag
    }
}
