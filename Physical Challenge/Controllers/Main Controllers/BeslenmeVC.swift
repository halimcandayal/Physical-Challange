//
//  BeslenmeVC.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

class BeslenmeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productData: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        loadJson()

    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
            }catch {
                
            }
        }
    }
    
    func moveOnProductListing(index: Int) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BeslenmeDetVC") as? BeslenmeDetVC else{
            return
        }
        vc.productListing = productData?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveOnProductDetails(tindex: Int, cindex: Int) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BeslenmeLastVC") as? BeslenmeLastVC else{
            return
        }
        vc.productDetails = productData?.response?[tindex].products?[cindex]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension BeslenmeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.response?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeslenmeTVCell", for: indexPath) as? BeslenmeTVCell else {
            return UITableViewCell()
        }
        cell.products = productData?.response?[indexPath.row]
        cell.index = indexPath.row
        cell.onClickedSeeAllClosure = { index in
            if let indexp = index {
                self.moveOnProductListing(index: indexp)
                
            }
            
        }
        cell.didSelectClosure = { tabIndex, colIndex in
            if let tabIndexp = tabIndex, let celIndexp = colIndex {
                self.moveOnProductDetails(tindex: tabIndexp, cindex: celIndexp)
            }
            
        }
        
        return cell
    }
    
    
}
