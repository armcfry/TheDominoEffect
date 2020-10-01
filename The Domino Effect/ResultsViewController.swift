//
//  SortViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/30/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class ResultsViewController:UIViewController{
    
    @IBAction func backSelect(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
        
    }
}
