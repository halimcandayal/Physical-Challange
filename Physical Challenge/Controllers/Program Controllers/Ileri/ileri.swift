//
//  ileri.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 3.04.2022.
//

import UIKit

class ileri: UIViewController {
    
    @IBOutlet weak var ileriTableView: UITableView!
    
    var chosenMovement: Movement?
    
    var myMovementFirstDay = [Movement]()
    var myMovementSecondDay = [Movement]()
    var myMovementThirdDay = [Movement]()
    var myMovementFourthDay = [Movement]()
    var myMovementFifthDay = [Movement]()
    var chosenDay = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ileriTableView.delegate = self
        ileriTableView.dataSource = self
        setupFirstDay()
        setupSecondDay()
        setupThirdDay()
        setupFourthDay()
        setupFifthDay()

        
    }
    func setupFirstDay() {
        
        let a = Movement(movementName: "Bench Press (4x12)", movementImage: UIImage(named: "bp")!)
        let b = Movement(movementName: "Incline Bench Press (4x12)", movementImage: UIImage(named: "ibp")!)
        let c = Movement(movementName: "Dumbbell Fly (4x12)", movementImage: UIImage(named: "df")!)
        let d = Movement(movementName: "Incline Dumbbell Fly (4x12)", movementImage: UIImage(named: "idf")!)
        let e = Movement(movementName: "Cable Crossover (4x16)", movementImage: UIImage(named: "cco")!)
        
        myMovementFirstDay.append(a)
        myMovementFirstDay.append(b)
        myMovementFirstDay.append(c)
        myMovementFirstDay.append(d)
        myMovementFirstDay.append(e)
        
    }
    
    func setupSecondDay() {
        
        let a = Movement(movementName: "Lat Pulldown (4x12)", movementImage: UIImage(named: "lpd")!)
        let b = Movement(movementName: "Close Grip Pulldown (4x12)", movementImage: UIImage(named: "cgp")!)
        let c = Movement(movementName: "Cable Row (4x12)", movementImage: UIImage(named: "scr")!)
        let d = Movement(movementName: "Barbell Row (4x12)", movementImage: UIImage(named: "br")!)
        let e = Movement(movementName: "Hyperextension (4x16)", movementImage: UIImage(named: "bc")!)
        
        
        myMovementSecondDay.append(a)
        myMovementSecondDay.append(b)
        myMovementSecondDay.append(c)
        myMovementSecondDay.append(d)
        myMovementSecondDay.append(e)
        
    }
    
    func setupThirdDay() {
        
        let a = Movement(movementName: "Dumbbell Lateral Raise (4x12)", movementImage: UIImage(named: "lr")!)
        let b = Movement(movementName: "Dumbbell Front Raise (4x12)", movementImage: UIImage(named: "dfr")!)
        let c = Movement(movementName: "Military Press (4x12)", movementImage: UIImage(named: "op")!)
        let d = Movement(movementName: "Dumbbell Shoulder Press (4x12)", movementImage: UIImage(named: "dop")!)
        let e = Movement(movementName: "Upright Row (4x12)", movementImage: UIImage(named: "urr")!)
        
        
        
        myMovementThirdDay.append(a)
        myMovementThirdDay.append(b)
        myMovementThirdDay.append(c)
        myMovementThirdDay.append(d)
        myMovementThirdDay.append(e)
        
    }
    
    func setupFourthDay() {
        
        let a = Movement(movementName: "Triceps Rope Pressdown (4x12)", movementImage: UIImage(named: "trp")!)
        let b = Movement(movementName: "Triceps Extension (4x12)", movementImage: UIImage(named: "te")!)
        let c = Movement(movementName: "Pushdown (4x12)", movementImage: UIImage(named: "pd")!)
        let d = Movement(movementName: "Biceps Curl (4x12)", movementImage: UIImage(named: "bc")!)
        let e = Movement(movementName: "Hammer Curl (4x12)", movementImage: UIImage(named: "hc")!)
        let f = Movement(movementName: "Machine Preacher Curl (4x12)", movementImage: UIImage(named: "mpc")!)
        
        
        myMovementFourthDay.append(a)
        myMovementFourthDay.append(b)
        myMovementFourthDay.append(c)
        myMovementFourthDay.append(d)
        myMovementFourthDay.append(e)
        myMovementFourthDay.append(f)
        
    }
    
    func setupFifthDay() {
        
        let a = Movement(movementName: "Leg Press (4x12)", movementImage: UIImage(named: "lp")!)
        let b = Movement(movementName: "Leg Extension (4x16)", movementImage: UIImage(named: "le")!)
        let c = Movement(movementName: "Leg Curl (4x16)", movementImage: UIImage(named: "lc")!)
        let d = Movement(movementName: "Hip Trust (4x16)", movementImage: UIImage(named: "ht")!)
        let e = Movement(movementName: "Calf Raise (3x20)", movementImage: UIImage(named: "cr")!)
        
        
        myMovementFifthDay.append(a)
        myMovementFifthDay.append(b)
        myMovementFifthDay.append(c)
        myMovementFifthDay.append(d)
        myMovementFifthDay.append(e)
        
    }
    
}

extension ileri: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if chosenDay == 1 {
            return myMovementFirstDay.count
        } else if chosenDay == 2 {
            return myMovementSecondDay.count
        } else if chosenDay == 3 {
            return myMovementThirdDay.count
        } else if chosenDay == 4 {
            return myMovementFourthDay.count
        } else if chosenDay == 5 {
            return myMovementFifthDay.count
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
        } else if chosenDay == 4 {
            cell.textLabel?.text = myMovementFourthDay[indexPath.row].name
            return cell
        } else if chosenDay == 5 {
            cell.textLabel?.text = myMovementFifthDay[indexPath.row].name
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
        } else if chosenDay == 4 {
            chosenMovement = myMovementFourthDay[indexPath.row]
        } else if chosenDay == 5 {
            chosenMovement = myMovementFifthDay[indexPath.row]
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
