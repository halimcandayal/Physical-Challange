//
//  PersonalVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 1.04.2022.
//

import UIKit
import CoreData

class PersonalVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var iimageView: UIImageView!
    @IBOutlet weak var kgText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var chosenPersonalData = ""
    var chosenPersonalDataId: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPersonalData != "" {
            
            saveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
                    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonalData")
            let idString = chosenPersonalDataId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
                    
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let note = result.value(forKey: "note") as? String {
                            kgText.text = note
                        }
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            iimageView.image = image
                        }
                    }
                }
            } catch {
                print("Error")
            }
                
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
        }
        
        iimageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        iimageView.addGestureRecognizer(gestureRecognizer)
        
        

        
    }

    @objc func chooseImage() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
        
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        iimageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                
        let newPersonalData = NSEntityDescription.insertNewObject(forEntityName: "PersonalData", into: context)
                
        newPersonalData.setValue(kgText.text, forKey: "note")
        newPersonalData.setValue(UUID(), forKey: "id")
        let data = iimageView.image!.jpegData(compressionQuality: 0.5)
        newPersonalData.setValue(data, forKey: "image")
        do {
            try context.save()
            print("Succes")
        } catch {
            print("Error")
        }
                
        NotificationCenter.default.post(name: NSNotification.Name("NewData"), object: nil)
        self.navigationController?.popViewController(animated: true)
                
    }
        
}
