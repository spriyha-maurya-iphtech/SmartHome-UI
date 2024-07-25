//
//  SecondCollectionViewCell.swift
//  UIDesign
//
//  Created by iPHTech34 on 10/07/24.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondTitleLabel: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            setupCell()
       
        }

        private func setupCell() {
            contentView.layer.cornerRadius = 30
            contentView.layer.masksToBounds = true
            contentView.layer.borderColor = UIColor.darkGray.cgColor
            contentView.layer.borderWidth = 0.5
            
            layer.shadowColor = UIColor(red: 34/255, green: 75/255, blue: 82/255, alpha: 1.0).cgColor


            layer.shadowOpacity = 0.7
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowRadius = 3
            layer.masksToBounds = false

            
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        }

        func secondconfigure(title: String, imageName: String, statusname: String, time: String) {
            secondTitleLabel.text = title
            secondImageView.image = UIImage(named: imageName)
            statusLabel.text = statusname
            timeLabel.text = time
        }
}

