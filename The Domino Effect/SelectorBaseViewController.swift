//
//  SelectorBaseViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/23/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class SelectorBaseViewController: UIViewController{
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backSelect(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    

    
}
