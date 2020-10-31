//
//  SortViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/30/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class ResultsViewController:UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    
    var indexNum = 1
    @IBOutlet weak var resultCollectionView: UICollectionView!
    @IBAction func backSelect(_ sender: UIButton) {
        DominoManager.shared.resetDominos()
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
    }

    override func viewWillAppear(_ animated: Bool) {
        indexNum = 1
    }
    
    override func viewDidLoad() {
        // set view controller as datasource and delegate of collectionView
        resultCollectionView.dataSource = self
        resultCollectionView.delegate = self
        
        
    }
    
    
    // MARK: - Collection View Delegate Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //return number of sorted dominos
        print(DominoManager.shared.dominosFiltered.count)
        
        return DominoManager.shared.dominosFiltered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dominoCell", for: indexPath) as! DominoCollectionViewCell
        
        // TODO: configure it
        cell.setCellImage(domino: DominoManager.shared.dominosFiltered[indexPath.row])

        // return it
        return cell
    }
}
