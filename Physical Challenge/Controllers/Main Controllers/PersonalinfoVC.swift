//
//  PersonalinfoVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 26.03.2022.
//

import UIKit
import Firebase
import CoreData

class PersonalinfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var perTableView: UITableView!
    
    var userKgArray = [String]()
    var idArray = [UUID]()
    var selectedPersonalData = ""
    var selectedPersonalDataId: UUID?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        perTableView.delegate = self
        perTableView.dataSource = self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        getData()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "NewData"), object: nil)
    }
    
    @objc func getData()  {
        
        idArray.removeAll(keepingCapacity: false)
        userKgArray.removeAll(keepingCapacity: false)
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonalData")
        fetchRequest.returnsObjectsAsFaults = false
                
        do {
            let results = try context.fetch(fetchRequest)
                    
            for result in results as! [NSManagedObject]{
                if let note = result.value(forKey: "note") as? String{
                    self.userKgArray.append(note)
                }
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                self.perTableView.reloadData()
            }
                    
        }catch {
            print("Error")
        }
        
    }
    
    @objc func addButtonClicked() {
        
        selectedPersonalData = ""
        performSegue(withIdentifier: "toPersonalVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = userKgArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userKgArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPersonalVC" {
            let destinationVC = segue.destination as! PersonalVC
            destinationVC.chosenPersonalData = selectedPersonalData
            destinationVC.chosenPersonalDataId = selectedPersonalDataId
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        selectedPersonalData = userKgArray[indexPath.row]
        selectedPersonalDataId = idArray[indexPath.row]
        performSegue(withIdentifier: "toPersonalVC", sender: nil)
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
            
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonalData")
            
        let idString = idArray[indexPath.row].uuidString
            
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
        fetchRequest.returnsObjectsAsFaults = false
            
        do {
        let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                    
                for result in results as! [NSManagedObject] {
                    if let id = result.value(forKey: "id") as? UUID {
                        if id == idArray[indexPath.row] {
                            context.delete(result)
                            userKgArray.remove(at: indexPath.row)
                            idArray.remove(at: indexPath.row)
                            self.perTableView.reloadData()
                            do {
                                try context.save()
                            }catch {
                                print("Error")
                            }
                                
                                
                                
                                
                        }
                    }
                }
                    
            }
        } catch {
            print("Error")
                
        }
        


}
}
