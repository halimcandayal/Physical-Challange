//
//  OrtaMain.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

class OrtaMain: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ortamainTableView: UITableView!
    let gunArray: [String] = ["1. Gün", "2. Gün", "3. Gün", "4. Gün"]
    let imageArray = [UIImage(named: "g1"), UIImage(named: "g2"), UIImage(named: "g3"), UIImage(named: "g4")]
    var category = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ortamainTableView.delegate = self
        ortamainTableView.dataSource = self
        
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
            segueIdentifier = "toO1"
            category = 1
        case 1:
            segueIdentifier = "toO1"
            category = 2
        case 2:
            segueIdentifier = "toO1"
            category = 3
        case 3:
            segueIdentifier = "toO1"
            category = 4
        default: break
            
        }
        
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toO1" {
            if let orta = segue.destination as? Orta {
                if category == 1 {
                    orta.chosenDay = 1
                }else if category == 2 {
                    orta.chosenDay = 2
                }else if category == 3 {
                    orta.chosenDay = 3
                }else if category == 4 {
                    orta.chosenDay = 4
                }
            }
        }
    }
    
}









