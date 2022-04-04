//
//  MonsterMain.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

class MonsterMain: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var monmainTableView: UITableView!
    let gunArray: [String] = ["1. Gün", "2. Gün", "3. Gün", "4. Gün", "5. Gün", "6. Gün"]
    let imageArray = [UIImage(named: "g1"), UIImage(named: "g2"), UIImage(named: "g3"), UIImage(named: "g4"), UIImage(named: "g5"), UIImage(named: "g6")]
    var category = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monmainTableView.delegate = self
        monmainTableView.dataSource = self
        
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
            segueIdentifier = "toM1"
            category = 1
        case 1:
            segueIdentifier = "toM1"
            category = 2
        case 2:
            segueIdentifier = "toM1"
            category = 3
        case 3:
            segueIdentifier = "toM1"
            category = 4
        case 4:
            segueIdentifier = "toM1"
            category = 5
        case 5:
            segueIdentifier = "toM1"
            category = 6
            
            default: break
            
        }
        
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toM1" {
            if let monster = segue.destination as? Monster {
                if category == 1 {
                    monster.chosenDay = 1
                }else if category == 2 {
                    monster.chosenDay = 2
                }else if category == 3 {
                    monster.chosenDay = 3
                }else if category == 4 {
                    monster.chosenDay = 4
                }else if category == 5 {
                    monster.chosenDay = 5
                }else if category == 6 {
                    monster.chosenDay = 6
                }
            }
        }
    }
    
}













