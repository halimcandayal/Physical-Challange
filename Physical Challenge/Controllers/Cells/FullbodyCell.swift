//
//  FullbodyCell.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

class FullbodyCell: UITableViewCell {
    
    @IBOutlet weak var fbodyImageView: UIImageView!
    @IBOutlet weak var fbodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func configureP(with programName: String) {
        fbodyLabel.text = programName
    }
    func configureI(with imageName: UIImage) {
        fbodyImageView.image = imageName
    }

}
