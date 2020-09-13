//
//  ViewController.swift
//  SidelineSwapChallenge
//
//  Created by Gershy Lev on 9/13/20.
//  Copyright © 2020 Gershy Lev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var items: [Item]?
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sl = SidelineSwapAPI()
        sl.getItems(searchTerm: "nike bag", page: 1) { (items) in
            DispatchQueue.main.async {
                self.items = items
                self.collectionView.reloadData()
            }
            print(items)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indentifier = "ItemCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as! ItemCollectionViewCell
        guard let item = items?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.sellerNameLabel.text = item.seller?.username
        cell.titleLabel.text = item.name
        cell.priceLabel.text = "$" + String(item.price)
//        cell.titleLabel.text = item.displayName
//        cell.imageView.image = UIImage(named: item.displayName)
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 3
//        cell.layer.borderColor = selectedInterests.contains(item) ? UIColor.orange.cgColor : UIColor.blue.cgColor
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let visibleCells = self.collectionView.visibleCells
//        if indexPath.row <= visibleCells.count && !collectionView.isUserInteractionEnabled {
//            cell.layer.opacity = 0
//            cell.contentView.alpha = 0
//            let d = Double.random(in: 0.5...1.7)
//            let delay = Double(Double(indexPath.row) * 0.03) + 0.4
//            UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseInOut, animations: {
//                cell.contentView.alpha = 1
//                cell.layer.opacity = 1
//            }, completion: { (completed) in
//                collectionView.isUserInteractionEnabled = true
//            })
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.size.width - 45) / 2
        return CGSize(width: itemWidth, height: itemWidth * 1.2)
    }
}

