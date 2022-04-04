//
//  Karin.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

class Karin: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var karinTableView: UITableView!
    var myMovement = [Movement]()
    var chosenMovement : Movement?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        karinTableView.delegate = self
        karinTableView.dataSource = self
        
        let a = Movement(movementName: "Scissors (30sn)", movementImage: UIImage(named: "sci")!)
        let b = Movement(movementName: "Crunchess Knee (30sn)", movementImage: UIImage(named: "ck")!)
        let c = Movement(movementName: "Plank (30sn)", movementImage: UIImage(named: "pla")!)
        let d = Movement(movementName: "Leg Raises (30sn)", movementImage: UIImage(named: "ler")!)
        let e = Movement(movementName: "Dead Bug (30sn)", movementImage: UIImage(named: "db")!)
        let f = Movement(movementName: "Russian Twist (30sn)", movementImage: UIImage(named: "rt")!)
        let g = Movement(movementName: "Flutter Kicks (30sn)", movementImage: UIImage(named: "fk")!)
        let h = Movement(movementName: "Elbows To Knee (30sn)", movementImage: UIImage(named: "etk")!)
        
        
        
        
        myMovement.append(a)
        myMovement.append(b)
        myMovement.append(c)
        myMovement.append(d)
        myMovement.append(e)
        myMovement.append(f)
        myMovement.append(g)
        myMovement.append(h)
        
        
        
        

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovement.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myMovement[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenMovement = myMovement[indexPath.row]
        self.performSegue(withIdentifier: "toDVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedMovement = chosenMovement
                
        }
    }

}
