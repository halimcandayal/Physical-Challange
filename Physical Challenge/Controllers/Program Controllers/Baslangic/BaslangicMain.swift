//
//  BaslangicMain.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

class BaslangicMain: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var basmainTableView: UITableView!
    let gunArray: [String] = ["1. Gün", "2. Gün", "3. Gün"]
    let imageArray = [UIImage(named: "g1"), UIImage(named: "g2"), UIImage(named: "g3")]
    var category = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basmainTableView.delegate = self
        basmainTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if let programCell = tableView.dequeueReusableCell(withIdentifier: "fbCell", for: indexPath) as? FullbodyCell{
            
            programCell.configureP(with: gunArray[indexPath.row])
            programCell.configureI(with: imageArray[indexPath.row]!)
            
            cell = programCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if category == 0 {
            return gunArray.count
        }
     return 1
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var segueIdentifier = ""

        switch(indexPath.row) {
        case 0:
            segueIdentifier = "toB1"
            category = 1
        case 1:
            segueIdentifier = "toB1"
            category = 2
        case 2:
            segueIdentifier = "toB1"
            category = 3
        default: break
            
        }
        
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toB1" {
            if let baslangic = segue.destination as? Baslangic {
                if category == 1 {
                    baslangic.chosenDay = 1
                }else if category == 2 {
                    baslangic.chosenDay = 2
                }else if category == 3 {
                    baslangic.chosenDay = 3
                }
            }
        }
    }
    
}








