//
//  SelectorBaseViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/23/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class SelectorBaseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backSelect(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
    }
    @IBOutlet weak var selectCollectionView: UICollectionView!
    
    var groupSelect = 4
    @objc func buttonClicked(_ sender: UIButton){
        switch sender.tag {
            case 1:
                groupSelect = 1
            case 2:
                groupSelect = 2
            case 3:
                groupSelect = 3
            case 4:
                groupSelect = 4
            case 5:
                groupSelect = 5
            case 6:
                groupSelect = 6
            case 7:
                groupSelect = 7
            case 8:
                groupSelect = 8
            case 9:
                groupSelect = 9
            case 10:
                groupSelect = 0
            default:
                print("default")
        }
        moveToIndividualSelect()
    }

    func moveToIndividualSelect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           self.performSegue(withIdentifier: "toNumberView", sender: self)
        })
    }
    
    @IBAction func moveToSort(_ sender: UIButton) {
        groupSelect = 11
        let filterResult = DominoManager.shared.filterDominos(dominos:DominoManager.shared.dominos)
        if filterResult.count >= 2{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
               self.performSegue(withIdentifier: "moveToSort", sender: self)
            })
        }
        else{
            return
        }
    }
    
    // gather information to send to the next VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is NumberMenuViewController{
            let segVC = segue.destination as! NumberMenuViewController
        
            // send the VC what domino was selected
            segVC.numberToShow = groupSelect
        }
    }
    
    override func viewDidLoad() {
        // set view controller as datasource and delegate of collectionView
        selectCollectionView.dataSource = self
        selectCollectionView.delegate = self
    }
    
    
    // MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DominoManager.shared.menuDominos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dominoButtonCell", for: indexPath) as! SelectCollectionViewCell
        // configure it
        if indexPath.row + 1 == 10{
            cell.setCellTag(tag:0)
        } else{
            cell.setCellTag(tag:indexPath.row+1)
        }
        
        cell.setCellImage(imgName: DominoManager.shared.menuDominos[indexPath.row])
        cell.dominoButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        // return it
        return cell

    }
    
}
