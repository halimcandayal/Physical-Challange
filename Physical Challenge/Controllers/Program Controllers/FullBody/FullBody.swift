//
//  FullBody.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 2.04.2022.
//

import Foundation
import UIKit

class FullBody: UIViewController {
    
    @IBOutlet weak var fullBodyTableView: UITableView!
    
    var chosenMovement: Movement?
    
    var myMovementFirstDay = [Movement]()
    var myMovementSecondDay = [Movement]()
    var myMovementThirdDay = [Movement]()
    var chosenDay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullBodyTableView.delegate = self
        fullBodyTableView.dataSource = self
        setupFirstDay()
        setupSecondDay()
        setupThirdDay()
    }
    
    func setupFirstDay() {
        
        let a = Movement(movementName: "Bench Press(3x10)", movementImage: UIImage(named: "bp")!)
        let b = Movement(movementName: "Dumbbell Fly (3x10)", movementImage: UIImage(named: "df")!)
        let c = Movement(movementName: "Lateral Raise (3x10)", movementImage: UIImage(named: "lr")!)
        let d = Movement(movementName: "Lat Pulldown (3x10)", movementImage: UIImage(named: "lpd")!)
        let e = Movement(movementName: "Overhead Dumbble Press (3x10)", movementImage: UIImage(named: "dop")!)
        let f = Movement(movementName: "Triceps Rope Pressdown (3x10)", movementImage: UIImage(named: "trp")!)
        let g = Movement(movementName: "Biceps Curl (3x10)", movementImage: UIImage(named: "bc")!)
        let h = Movement(movementName: "Leg Extension (3x10)", movementImage: UIImage(named: "le")!)
        let i = Movement(movementName: "Lying Leg Curl (3x10)", movementImage: UIImage(named: "lc")!)
        let j = Movement(movementName: "Mekik (3x10)", movementImage: UIImage(named: "mek")!)
        
        myMovementFirstDay.append(a)
        myMovementFirstDay.append(b)
        myMovementFirstDay.append(c)
        myMovementFirstDay.append(d)
        myMovementFirstDay.append(e)
        myMovementFirstDay.append(f)
        myMovementFirstDay.append(g)
        myMovementFirstDay.append(h)
        myMovementFirstDay.append(i)
        myMovementFirstDay.append(j)
    
    }
    
    func setupSecondDay() {
        
        let a = Movement(movementName: "Bench Press(3x10)", movementImage: UIImage(named: "bp")!)
        let b = Movement(movementName: "Dumbbell Fly (3x10)", movementImage: UIImage(named: "df")!)
        let c = Movement(movementName: "Lat Pulldown (3x10)", movementImage: UIImage(named: "lpd")!)
        let d = Movement(movementName: "Overhead Press (3x10)", movementImage: UIImage(named: "op")!)
        let e = Movement(movementName: "Dumbbell Lateral Raise (3x10)", movementImage: UIImage(named: "lr")!)
        let f = Movement(movementName: "Biceps Curl (3x10)", movementImage: UIImage(named: "bc")!)
        let g = Movement(movementName: "Machine Preacher Curl (3x10)", movementImage: UIImage(named: "mpc")!)
        let h = Movement(movementName: "Pushdown (3x10)", movementImage: UIImage(named: "pd")!)
        let i = Movement(movementName: "Triceps Extension (3x10)", movementImage: UIImage(named: "te")!)
        let j = Movement(movementName: "Mekik (3x10)", movementImage: UIImage(named: "mek")!)
    
    
        myMovementSecondDay.append(a)
        myMovementSecondDay.append(b)
        myMovementSecondDay.append(c)
        myMovementSecondDay.append(d)
        myMovementSecondDay.append(e)
        myMovementSecondDay.append(f)
        myMovementSecondDay.append(g)
        myMovementSecondDay.append(h)
        myMovementSecondDay.append(i)
        myMovementSecondDay.append(j)
    }
    
    func setupThirdDay() {
        
        
        let a = Movement(movementName: "Incle Bench Press(3x10)", movementImage: UIImage(named: "ibp")!)
        let b = Movement(movementName: "Inclıne Fly (3x10)", movementImage: UIImage(named: "idf")!)
        let c = Movement(movementName: "Lat Pulldown (3x10)", movementImage: UIImage(named: "lpd")!)
        let d = Movement(movementName: "Cable Row (3x10)", movementImage: UIImage(named: "scr")!)
        let e = Movement(movementName: "Dumbbell Lateral Raise (3x10)", movementImage: UIImage(named: "lr")!)
        let f = Movement(movementName: "Dumbbell Front Raise (3x10)", movementImage: UIImage(named: "dfr")!)
        let g = Movement(movementName: "Leg Press (3x10)", movementImage: UIImage(named: "lp")!)
        let h = Movement(movementName: "Leg Extension (3x10)", movementImage: UIImage(named: "le")!)
        let i = Movement(movementName: "Calf Raise (3x16)", movementImage: UIImage(named: "cr")!)
        let j = Movement(movementName: "Mekik (3x10)", movementImage: UIImage(named: "mek")!)
        
        myMovementThirdDay.append(a)
        myMovementThirdDay.append(b)
        myMovementThirdDay.append(c)
        myMovementThirdDay.append(d)
        myMovementThirdDay.append(e)
        myMovementThirdDay.append(f)
        myMovementThirdDay.append(g)
        myMovementThirdDay.append(h)
        myMovementThirdDay.append(i)
        myMovementThirdDay.append(j)
    }
    
}

extension FullBody: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if chosenDay == 1 {
            return myMovementFirstDay.count
        } else if chosenDay == 2 {
            return myMovementSecondDay.count
        } else if chosenDay == 3 {
            return myMovementThirdDay.count
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if chosenDay == 1 {
            cell.textLabel?.text = myMovementFirstDay[indexPath.row].name
            return cell
        } else if chosenDay == 2 {
            cell.textLabel?.text = myMovementSecondDay[indexPath.row].name
            return cell
        } else if chosenDay == 3 {
            cell.textLabel?.text = myMovementThirdDay[indexPath.row].name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if chosenDay == 1 {
            chosenMovement = myMovementFirstDay[indexPath.row]
        } else if chosenDay == 2 {
            chosenMovement = myMovementSecondDay[indexPath.row]
        } else if chosenDay == 3 {
            chosenMovement = myMovementThirdDay[indexPath.row]
        }
        self.performSegue(withIdentifier: "toDVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedMovement = chosenMovement
                
        }
    }
}
