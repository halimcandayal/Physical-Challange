//
//  BeslenmeLastVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 31.03.2022.
//

import UIKit

class BeslenmeLastVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var productDetails: ProductDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = productDetails?.name
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
}

extension BeslenmeLastVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeslenmeDetCell") as? BeslenmeDetCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = productDetails?.name
        cell.descLabel.text = productDetails?.description
        cell.proImg.image = UIImage(named: productDetails?.imageName ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
