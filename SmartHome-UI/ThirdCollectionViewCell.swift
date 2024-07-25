//
//  ThirdCollectionViewCell.swift
//  UIDesign
//
//  Created by iPHTech34 on 11/07/24.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdImageView: UIImageView!
    var gradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
        self.layer.borderWidth = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        gradientView = GradientView(frame: self.contentView.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(gradientView)
        self.contentView.sendSubviewToBack(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        gradientView.isHidden = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        gradientView.frame = contentView.bounds
    }
}



