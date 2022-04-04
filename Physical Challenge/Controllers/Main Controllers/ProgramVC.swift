//
//  ProgramVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 1.04.2022.
//

import UIKit

class ProgramVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let programArray: [String] = ["Full Body Antreman", "Başlangıç Seviye", "Orta Seviye", "İleri Seviye", "Monster Seviye", "Karın Antremanı"]
    let imageArray = [UIImage(named: "full"), UIImage(named: "bas"), UIImage(named: "ort"), UIImage(named: "ile"), UIImage(named: "mon"), UIImage(named: "abs")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return programArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let programCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PCell", for: indexPath) as? ProgramCell{
            
            programCell.configureP(with: programArray[indexPath.row])
            programCell.configureI(with: imageArray[indexPath.row]!)
            programCell.layer.cornerRadius = 15
            cell = programCell
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var segueIdentifier = ""

        switch(indexPath.row) {
        case 0:
            segueIdentifier = "toFullB"
        case 1:
            segueIdentifier = "toBas"
        case 2:
            segueIdentifier = "toOrta"
        case 3:
            segueIdentifier = "toile"
        case 4:
            segueIdentifier = "toMons"
        case 5:
            segueIdentifier = "toKar"
        default: break
            
        }
        
        performSegue(withIdentifier: segueIdentifier, sender: self)

    }
    
}


