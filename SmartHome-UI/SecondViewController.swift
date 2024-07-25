//
//  SecondViewController.swift
//  UIDesign
//
//  Created by iPHTech34 on 10/07/24.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var bedroom: UILabel!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    let titles = ["Climate","Fan", "Purifier","light", "AC"]
    let images = ["climate", "fan", "purifier","light","cooler"]
    let Status = ["OFF","ON","ON","OFF", "OFF"]
    let Time = ["0hr52min","2hr36min","5hr13min","3hr28min","8hr52min"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SecondCollectionViewCell", bundle: nil)
        secondCollectionView.register(nib, forCellWithReuseIdentifier: "SecondCollectionViewCell")
        let gradientLayer = getGradientLayer1(bounds: bedroom.bounds)
        bedroom.textColor = gradientColor(bounds: bedroom.bounds, gradientLayer: gradientLayer)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        let title = titles[indexPath.item]
        let imageName = images[indexPath.item]
        let statusname = Status[indexPath.item]
        let time = Time[indexPath.item]
        cell.secondconfigure(title: title, imageName: imageName,statusname: statusname,time: time)
        
        if indexPath.item == 1 || indexPath.item == 2 {
            applyGradient(to: cell.contentView)
        }
        return cell
    }
}
