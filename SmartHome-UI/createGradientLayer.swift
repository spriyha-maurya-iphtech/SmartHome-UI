//
//  createGradientLayer.swift
//  UIDesign
//
//  Created by iPHTech34 on 03/07/24.
//
import UIKit

func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
let gradient = CAGradientLayer()
gradient.frame = bounds
//order of gradient colors
    gradient.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
// start and end points
    
gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
return gradient
}

func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
    UIGraphicsBeginImageContext(gradientLayer.bounds.size)
    //create UIImage by rendering gradient layer.
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    //get gradient UIcolor from gradient UIImage
    return UIColor(patternImage: image!)
}
func applyGradient(to view: UIView) {
    // Print statements for debugging
    print("EnergyView frame:", view.frame)
    print("EnergyView bounds:", view.bounds)
    
    // Create gradient layer
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    
    // Set custom gradient colors
    gradientLayer.colors = [
        UIColor(red: 44/255, green: 106/255, blue: 216/255, alpha: 1.0).cgColor,
        UIColor(red: 78/255, green: 228/255, blue: 149/255, alpha: 1.0).cgColor
    ]
    
    // Set custom gradient direction
    
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    
    // Remove any existing gradients before applying new one
  //  view.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
    
    // Add gradient to view's layer
    if let oldGradientLayer = view.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
              view.layer.replaceSublayer(oldGradientLayer, with: gradientLayer)
          } else {
              view.layer.insertSublayer(gradientLayer, at: 0)
          }
}
//func applyWhiteGradient(to label: UILabel) {
//    // Print statements for debugging
//    print("Label frame:", label.frame)
//    print("Label bounds:", label.bounds)
//
//    // Create gradient layer
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.frame = label.bounds
//
//    // Set gradient colors (white shades)
//    gradientLayer.colors = [
//        UIColor(red: 107/255, green: 128/255, blue: 135/255, alpha: 1.0).cgColor,
//        UIColor(red: 219/255, green: 233/255, blue: 236/255, alpha: 1.0).cgColor
//    ]
//
//    // Set gradient direction
//    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//
//    // Remove any existing gradients before applying new one
//    label.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
//
//    // Add gradient to label's layer
//    label.layer.insertSublayer(gradientLayer, at: 0)
//
//    // Print statement for debugging
//    print("White gradient layer added to label")
//}
//
func getGradientLayer1(bounds : CGRect) -> CAGradientLayer{
let gradient = CAGradientLayer()
gradient.frame = bounds
//order of gradient colors
    gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
// start and end points
    
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
return gradient
}
