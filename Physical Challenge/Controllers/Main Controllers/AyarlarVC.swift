//
//  AyarlarVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 25.03.2022.
//

import UIKit
import Firebase
import CoreData

class AyarlarVC: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        performSegue(withIdentifier: "toMainVC", sender: nil)
        }catch {
            print("Error")
        }
        
    }
    
}
