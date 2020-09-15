//
//  ItemCollectionViewCell.swift
//  SidelineSwapChallenge
//
//  Created by Gershy Lev on 9/13/20.
//  Copyright © 2020 Gershy Lev. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sellerNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        layer.cornerRadius = 5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.3
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.darkGray.withAlphaComponent(0.01).cgColor, UIColor.black.cgColor]
        gradientLayer.frame = CGRect(x: 0, y: itemImageView.bounds.height, width: itemImageView.bounds.width, height: 75.0)
        itemImageView.layer.addSublayer(gradientLayer)
    }
}
