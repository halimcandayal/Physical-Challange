//
//  ProgramCell.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 28.03.2022.
//

import UIKit

class ProgramCell: UICollectionViewCell {
    
    
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureP(with programName: String) {
        programLabel.text = programName
    }
    func configureI(with imageName: UIImage) {
        imageView.image = imageName
    }

    
    
}
