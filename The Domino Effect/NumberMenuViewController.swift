//
//  NumberMenuViewController.swift
//  The Domino Effect
//
//  Created by Adam McFry on 9/27/20.
//  Copyright © 2020 Adam McFry. All rights reserved.
//

import UIKit

class NumberMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var numberMenuCollectionView: UICollectionView!
    

    var numberToShow = 0
    
    @IBAction func selectDomino(sender: UIButton) {


    }
    
    // go back to the previous screen
    @IBAction func backSelect(_ sender: UIButton) {
        SoundManager.shared.playSound(effect: .select)
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    @IBAction func unwindToSelectorBase(sender: UIStoryboardSegue){
        
    }
    
    @objc func buttonClicked(_ sender: UIButton){
        SoundManager.shared.playSound(effect: .select)
        DominoManager.shared.selectDomino(head: numberToShow, tail: sender.tag)
        if DominoManager.shared.dominos[numberToShow][sender.tag].isSelected == true {
            sender.layer.opacity -= 0.5;
        }
        else{
            sender.layer.opacity += 0.5;
        }
        print(DominoManager.shared.dominos)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        // change the outfit for the buttons

    }
    
    override func viewDidLoad() {
        // set view controller as datasource and delegate of collectionView
        numberMenuCollectionView.dataSource = self
        numberMenuCollectionView.delegate = self
    }
    
    // MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DominoManager.shared.menuDominos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dominoButtonCell", for: indexPath) as! SelectCollectionViewCell
        // configure it
        
        // set the tag
        if indexPath.row + 1 == 10{
            cell.setCellTag(tag:0)
        } else{
            cell.setCellTag(tag:indexPath.row+1)
        }
        
        // set the image
        switch numberToShow {
            case 1:
                cell.setCellImage(imgName: "Red Dominos Non-Glow Set-0")
            case 2:
                cell.setCellImage(imgName: "Orange Dominos Non-Glow Set-0")
            case 3:
                cell.setCellImage(imgName: "Yellow Dominos Non-Glow Set-0")
            case 4:
                cell.setCellImage(imgName: "Lime Green Dominos Non-Glow Set-0")
            case 5:
                cell.setCellImage(imgName: "Forest Green Dominos Non-Glow Set-0")
            case 6:
                cell.setCellImage(imgName: "Aqua Dominos Non-Glow Set-0")
            case 7:
                cell.setCellImage(imgName: "Royal Blue Dominos Non-Glow Set-0")
            case 8:
                cell.setCellImage(imgName: "Purple Dominos Non-Glow Set-0")
            case 9:
                cell.setCellImage(imgName: "Pink Dominos Non-Glow Set-0")
            case 0:
                cell.setCellImage(imgName: "White Dominos Non-Glow Set-0")
            default:
                print("default")
        }
        
        // check if the domino has been marked as selected or not yet
        if DominoManager.shared.dominos[numberToShow][cell.dominoButton.tag].isSelected == true {
            cell.dominoButton.layer.opacity = 0.5
        }
        else{
            cell.dominoButton.layer.opacity = 1
        }
        
        // add button function
        cell.dominoButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        // return it
        return cell

    }
    
}
