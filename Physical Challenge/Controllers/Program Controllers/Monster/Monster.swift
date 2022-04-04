//
//  Monster.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 3.04.2022.
//

import UIKit

class Monster: UIViewController {
    
    @IBOutlet weak var monsterTableView: UITableView!
    
    var chosenMovement: Movement?
    
    var myMovementFirstDay = [Movement]()
    var myMovementSecondDay = [Movement]()
    var myMovementThirdDay = [Movement]()
    var myMovementFourthDay = [Movement]()
    var myMovementFifthDay = [Movement]()
    var myMovementSixthDay = [Movement]()
    var chosenDay = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        monsterTableView.delegate = self
        monsterTableView.dataSource = self
        setupFirstDay()
        setupSecondDay()
        setupThirdDay()
        setupFourthDay()
        setupFifthDay()
        setupSixthDay()

        
    }
    
    func setupFirstDay() {
        
        let a = Movement(movementName: "Bench Press (4x12)", movementImage: UIImage(named: "bp")!)
        let b = Movement(movementName: "Incline Bench Press (4x12)", movementImage: UIImage(named: "ibp")!)
        let c = Movement(movementName: "Dumbbell Fly (3x12)", movementImage: UIImage(named: "df")!)
        let d = Movement(movementName: "Incline Dumbbell Fly (3x12)", movementImage: UIImage(named: "idf")!)
        let e = Movement(movementName: "Military Press (4x12)", movementImage: UIImage(named: "op")!)
        let f = Movement(movementName: "Lateral Raise (4x12)", movementImage: UIImage(named: "lr")!)
        let g = Movement(movementName: "Upright Row (3x12)", movementImage: UIImage(named: "urr")!)
        
        
        myMovementFirstDay.append(a)
        myMovementFirstDay.append(b)
        myMovementFirstDay.append(c)
        myMovementFirstDay.append(d)
        myMovementFirstDay.append(e)
        myMovementFirstDay.append(f)
        myMovementFirstDay.append(g)
        
    }
    
    func setupSecondDay() {
        
        let a = Movement(movementName: "Lat Pulldown (4x12)", movementImage: UIImage(named: "lpd")!)
        let b = Movement(movementName: "Close Grip Pulldown (4x12)", movementImage: UIImage(named: "cgp")!)
        let c = Movement(movementName: "Seated Cable Row (4x12)", movementImage: UIImage(named: "scr")!)
        let d = Movement(movementName: "Barbell Row (3x12)", movementImage: UIImage(named: "br")!)
        let e = Movement(movementName: "Biceps Curl (4x12)", movementImage: UIImage(named: "bc")!)
        let f = Movement(movementName: "Hammer Curl (4x12)", movementImage: UIImage(named: "hc")!)
        let g = Movement(movementName: "Machine Preacher Curl (3x12)", movementImage: UIImage(named: "mpc")!)
        
        
        myMovementSecondDay.append(a)
        myMovementSecondDay.append(b)
        myMovementSecondDay.append(c)
        myMovementSecondDay.append(d)
        myMovementSecondDay.append(e)
        myMovementSecondDay.append(f)
        myMovementSecondDay.append(g)
        
    }
    
    func setupThirdDay() {
        
        let a = Movement(movementName: "Leg Press (4x12)", movementImage: UIImage(named: "lp")!)
        let b = Movement(movementName: "Leg Extension (4x16)", movementImage: UIImage(named: "le")!)
        let c = Movement(movementName: "Leg Curl (4x16)", movementImage: UIImage(named: "lc")!)
        let d = Movement(movementName: "Hip Trust (4x16)", movementImage: UIImage(named: "ht")!)
        let e = Movement(movementName: "Calf Raise (3x20)", movementImage: UIImage(named: "cr")!)
        let f = Movement(movementName: "Triceps Rope Pressdown (4x12)", movementImage: UIImage(named: "trp")!)
        let g = Movement(movementName: "Triceps Extension (4x12)", movementImage: UIImage(named: "te")!)
        let h = Movement(movementName: "Pushdown (4x12)", movementImage: UIImage(named: "pd")!)
        
        
        myMovementThirdDay.append(a)
        myMovementThirdDay.append(b)
        myMovementThirdDay.append(c)
        myMovementThirdDay.append(d)
        myMovementThirdDay.append(e)
        myMovementThirdDay.append(f)
        myMovementThirdDay.append(g)
        myMovementThirdDay.append(h)
        
    }
    
    func setupFourthDay() {
        
        let a = Movement(movementName: "Bench Press (4x12)", movementImage: UIImage(named: "bp")!)
        let b = Movement(movementName: "Incline Bench Press (4x12)", movementImage: UIImage(named: "ibp")!)
        let c = Movement(movementName: "Dumbbell Fly (3x12)", movementImage: UIImage(named: "df")!)
        let d = Movement(movementName: "Incline Dumbbell Fly (3x12)", movementImage: UIImage(named: "idf")!)
        let e = Movement(movementName: "Military Press (4x12)", movementImage: UIImage(named: "op")!)
        let f = Movement(movementName: "Lateral Raise (4x12)", movementImage: UIImage(named: "lr")!)
        let g = Movement(movementName: "Upright Row (3x12)", movementImage: UIImage(named: "urr")!)
        
        
        myMovementFourthDay.append(a)
        myMovementFourthDay.append(b)
        myMovementFourthDay.append(c)
        myMovementFourthDay.append(d)
        myMovementFourthDay.append(e)
        myMovementFourthDay.append(f)
        myMovementFourthDay.append(g)
        
    }
    
    func setupFifthDay() {
        
        let a = Movement(movementName: "Lat Pulldown (4x12)", movementImage: UIImage(named: "lpd")!)
        let b = Movement(movementName: "Close Grip Pulldown (4x12)", movementImage: UIImage(named: "cgp")!)
        let c = Movement(movementName: "Seated Cable Row (4x12)", movementImage: UIImage(named: "scr")!)
        let d = Movement(movementName: "Barbell Row (3x12)", movementImage: UIImage(named: "br")!)
        let e = Movement(movementName: "Biceps Curl (4x12)", movementImage: UIImage(named: "bc")!)
        let f = Movement(movementName: "Hammer Curl (4x12)", movementImage: UIImage(named: "hc")!)
        let g = Movement(movementName: "Machine Preacher Curl (3x12)", movementImage: UIImage(named: "mpc")!)
        
        
        myMovementFifthDay.append(a)
        myMovementFifthDay.append(b)
        myMovementFifthDay.append(c)
        myMovementFifthDay.append(d)
        myMovementFifthDay.append(e)
        myMovementFifthDay.append(f)
        myMovementFifthDay.append(g)
        
    }
    
    func setupSixthDay() {
        
        let a = Movement(movementName: "Leg Press (4x12)", movementImage: UIImage(named: "lp")!)
        let b = Movement(movementName: "Leg Extension (4x16)", movementImage: UIImage(named: "le")!)
        let c = Movement(movementName: "Leg Curl (4x16)", movementImage: UIImage(named: "lc")!)
        let d = Movement(movementName: "Hip Trust (4x16)", movementImage: UIImage(named: "ht")!)
        let e = Movement(movementName: "Calf Raise (3x20)", movementImage: UIImage(named: "cr")!)
        let f = Movement(movementName: "Triceps Rope Pressdown (4x12)", movementImage: UIImage(named: "trp")!)
        let g = Movement(movementName: "Triceps Extension (4x12)", movementImage: UIImage(named: "te")!)
        let h = Movement(movementName: "Pushdown (4x12)", movementImage: UIImage(named: "pd")!)
        
        
        myMovementSixthDay.append(a)
        myMovementSixthDay.append(b)
        myMovementSixthDay.append(c)
        myMovementSixthDay.append(d)
        myMovementSixthDay.append(e)
        myMovementSixthDay.append(f)
        myMovementSixthDay.append(g)
        myMovementSixthDay.append(h)
        
    }
    
}

extension Monster: UITableViewDelegate, UITableViewDataSource {
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
        } else if chosenDay == 6 {
            return myMovementSixthDay.count
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
        } else if chosenDay == 6 {
            cell.textLabel?.text = myMovementSixthDay[indexPath.row].name
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
        } else if chosenDay == 6 {
            chosenMovement = myMovementSixthDay[indexPath.row]
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

