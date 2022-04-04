//
//  Baslangic.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 2.04.2022.
//

import UIKit

class Baslangic: UIViewController {
    
    
    @IBOutlet weak var baslangicTableView: UITableView!
    
    var chosenMovement: Movement?
    
    var myMovementFirstDay = [Movement]()
    var myMovementSecondDay = [Movement]()
    var myMovementThirdDay = [Movement]()
    var chosenDay = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        baslangicTableView.delegate = self
        baslangicTableView.dataSource = self
        setupFirstDay()
        setupSecondDay()
        setupThirdDay()

        
    }
    
    func setupFirstDay() {
        
        let a = Movement(movementName: "Bench Press(3x12)", movementImage: UIImage(named: "bp")!)
        let b = Movement(movementName: "Incline Bench Press (3x12)", movementImage: UIImage(named: "ibp")!)
        let c = Movement(movementName: "Dumbbell Fly (3x12", movementImage: UIImage(named: "df")!)
        let d = Movement(movementName: "Incline Dumbbell Fly (3x12)", movementImage: UIImage(named: "idf")!)
        let e = Movement(movementName: "Triceps Rope Pressdown (3x12)", movementImage: UIImage(named: "trp")!)
        let f = Movement(movementName: "Triceps Extension (3x12)", movementImage: UIImage(named: "te")!)
        let g = Movement(movementName: "Pushdown (3x12)", movementImage: UIImage(named: "pd")!)
        
        
        
        myMovementFirstDay.append(a)
        myMovementFirstDay.append(b)
        myMovementFirstDay.append(c)
        myMovementFirstDay.append(d)
        myMovementFirstDay.append(e)
        myMovementFirstDay.append(f)
        myMovementFirstDay.append(g)
        
    }
    
    func setupSecondDay() {
        
        let a = Movement(movementName: "Lat pulldown (3x12)", movementImage: UIImage(named: "lpd")!)
        let b = Movement(movementName: "Close grip Pulldown (3x10)", movementImage: UIImage(named: "cgp")!)
        let c = Movement(movementName: "Cable Row (3x10)", movementImage: UIImage(named: "scr")!)
        let d = Movement(movementName: "Hyperextension (3x10)", movementImage: UIImage(named: "hyp")!)
        let e = Movement(movementName: "Biceps Curl (3x10)", movementImage: UIImage(named: "bc")!)
        let f = Movement(movementName: "Hammer Curl (3x10)", movementImage: UIImage(named: "hc")!)
        let g = Movement(movementName: "Machine Preacher Curl (3x10)", movementImage: UIImage(named: "mpc")!)
        
        
        
        myMovementSecondDay.append(a)
        myMovementSecondDay.append(b)
        myMovementSecondDay.append(c)
        myMovementSecondDay.append(d)
        myMovementSecondDay.append(e)
        myMovementSecondDay.append(f)
        myMovementSecondDay.append(g)
        
    }
    
    func setupThirdDay() {
        
        let a = Movement(movementName: "Overhead Dumbble Press (3x12)", movementImage: UIImage(named: "dop")!)
        let b = Movement(movementName: "Lateral Raise (3x12)", movementImage: UIImage(named: "lr")!)
        let c = Movement(movementName: "Military Press (3x12)", movementImage: UIImage(named: "op")!)
        let d = Movement(movementName: "Leg Press (3x12)", movementImage: UIImage(named: "lp")!)
        let e = Movement(movementName: "Leg Extension (3x16)", movementImage: UIImage(named: "le")!)
        let f = Movement(movementName: "Leg Curl (3x16)", movementImage: UIImage(named: "lc")!)
        let g = Movement(movementName: "Calf Raise (3x20)", movementImage: UIImage(named: "cr")!)
        
        
        myMovementThirdDay.append(a)
        myMovementThirdDay.append(b)
        myMovementThirdDay.append(c)
        myMovementThirdDay.append(d)
        myMovementThirdDay.append(e)
        myMovementThirdDay.append(f)
        myMovementThirdDay.append(g)
        
    }
    
}

extension Baslangic: UITableViewDelegate, UITableViewDataSource {
    
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
