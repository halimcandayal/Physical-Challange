//
//  BeslenmeTVCell.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import UIKit

typealias SeeAllClosure = ((_ index: Int?) -> Void)
typealias DidSelectClosure = ((_ tableIndex: Int?, _ collectionIndex: Int?) -> Void)

class BeslenmeTVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var kategoriLabel: UILabel!
    
    var index: Int?
    var onClickedSeeAllClosure: SeeAllClosure?
    var didSelectClosure: DidSelectClosure?
    
    var products: Product? {
        didSet {
            kategoriLabel.text = products?.categoryName
            collectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func tumuButtonClicked(_ sender: Any) {
        onClickedSeeAllClosure?(index)
    }
}

extension BeslenmeTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.products?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeslenmeCVCell", for: indexPath) as? BeslenmeCVCell else {
            return UICollectionViewCell()
        }
        cell.productName.text = products?.products?[indexPath.row].name
        cell.img.image = UIImage(named: products?.products?[indexPath.row].imageName ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure?(index, indexPath.row)
    }
    
    
        
    
}
