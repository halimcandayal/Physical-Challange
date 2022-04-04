//
//  birveucDetailsVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 26.03.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image1View: UIImageView!
    
    
    var selectedMovement: Movement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedMovement?.name
        image1View.image = selectedMovement?.image
        
    }
    
}

