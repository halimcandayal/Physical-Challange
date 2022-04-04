//
//  BeslenmeDetCell.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 31.03.2022.
//

import UIKit

class BeslenmeDetCell: UITableViewCell {

    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
