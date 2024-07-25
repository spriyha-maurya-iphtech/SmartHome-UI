import UIKit

class ThirdViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var thirdView: UIView!
    var circularProgressBar: CircularProgressBar!
    let titles = ["On","On", "Lenevo AC","Off"]
    let images = ["wash", "tv", "ac","climate"]
    
    @IBOutlet weak var thirdcollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ThirdCollectionViewCell", bundle: nil)
        thirdcollectionview.register(nib, forCellWithReuseIdentifier: "ThirdCollectionViewCell")
        view.backgroundColor = UIColor(red: 15/255, green: 32/255, blue: 39/255, alpha: 1.0)
        thirdcollectionview.backgroundColor = .clear
        circularProgressBar = CircularProgressBar(frame: CGRect(x: 100, y:70, width: 200, height: 200))
        // circularProgressBar.center = thirdView.center
        thirdView.addSubview(circularProgressBar)
        circularProgressBar.trackColor = UIColor(red: 61/255, green: 88/255, blue: 95/255, alpha: 1.0)
        //  circularProgressBar.trackColor = UIColor.darkGray
        let gradientLayer = circularProgressBar.getGradientLayer(bounds: circularProgressBar.bounds)
        if let gradientColor = circularProgressBar.gradientColor(bounds: circularProgressBar.bounds, gradientLayer: gradientLayer) {
            circularProgressBar.progressColor = gradientColor
            }
              // Set progress with animation
            circularProgressBar.setProgress(to: 0.4, withAnimation: true)
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as! ThirdCollectionViewCell
        cell.thirdLabel.text = titles[indexPath.item]
        cell.thirdImageView.image = UIImage(named: images[indexPath.item])
        
        if titles[indexPath.item] == "Lenevo AC" {
            cell.gradientView.isHidden = false
        } else {
            cell.gradientView.isHidden = true
        }
        return cell
    }
}
        
    
   
        
        
        
      
    
    
    
    
  

