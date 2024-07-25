//
//  GradientView.swift
//  UIDesign
//
//  Created by iPHTech34 on 16/07/24.
//


import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        applyGradient2()
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradient2()
    }
    
    private func applyGradient2() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 44/255, green: 106/255, blue: 216/255, alpha: 1.0).cgColor,
            UIColor(red: 78/255, green: 228/255, blue: 149/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
