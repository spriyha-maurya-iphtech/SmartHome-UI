//
//  CurvedTabBar.swift
//  UIDesign
//
//  Created by iPHTech34 on 05/07/24.
//

import UIKit

class CurvedTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
 //   njk,
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor(red: 32/255, green: 77/255, blue: 87/255, alpha: 1.0).cgColor // Change this to match your tab bar color
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let height: CGFloat = 50
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        let curveHeight: CGFloat = 20
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerWidth - 35 - curveHeight, y: 0))
        
        path.addQuadCurve(to: CGPoint(x: centerWidth - 35, y: curveHeight), controlPoint: CGPoint(x: centerWidth - 35 - curveHeight / 2, y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth + 35, y: curveHeight), controlPoint1: CGPoint(x: centerWidth - 35 + curveHeight, y: curveHeight * 2), controlPoint2: CGPoint(x: centerWidth + 35 - curveHeight, y: curveHeight * 2))
        
        path.addQuadCurve(to: CGPoint(x: centerWidth + 35 + curveHeight, y: 0), controlPoint: CGPoint(x: centerWidth + 35 + curveHeight / 2, y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        
        return path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !self.clipsToBounds && !self.isHidden && self.alpha > 0 else { return nil }
        for member in self.subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            if let result = member.hitTest(subPoint, with: event) {
                return result
            }
        }
        return nil
    }
}


