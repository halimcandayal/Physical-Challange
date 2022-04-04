//
//  BeslenmeDetVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 31.03.2022.
//

import UIKit

class BeslenmeDetVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productListing: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = productListing?.categoryName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

    }
    
}

extension BeslenmeDetVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListing?.products?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeslenmeDetCell", for: indexPath) as? BeslenmeDetCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = productListing?.products?[indexPath.row].name
        cell.descLabel.text = productListing?.products?[indexPath.row].description
        cell.proImg.image = UIImage(named: productListing?.products?[indexPath.row].imageName ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BeslenmeLastVC") as? BeslenmeLastVC else {return}
        vc.productDetails = productListing?.products?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
