import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var prohomeLabel: UILabel!
    @IBOutlet weak var weatherView1: weatherView!
    @IBOutlet weak var energyView1: EnergyView!
    @IBOutlet weak var devicecollectionView: UICollectionView!
    @IBOutlet weak var tabBar: CurvedTabBar!
    @IBOutlet weak var devicesLabel: UILabel!
    private var addButton: UIButton!

    let titles = ["light", "AC", "Climate"]
    let images = ["light", "cooler", "climate"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        devicecollectionView.register(nib, forCellWithReuseIdentifier: "MyCollectionViewCell")
    }
    
    func setupUI() {
        let gradientLayer = getGradientLayer(bounds: prohomeLabel.bounds)
        prohomeLabel.textColor = gradientColor(bounds: prohomeLabel.bounds, gradientLayer: gradientLayer)
        setupEnergyView()
        
        // Add tap gesture recognizer to devicesLabel
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(devicesLabelTapped))
        devicesLabel.isUserInteractionEnabled = true
        devicesLabel.addGestureRecognizer(tapGesture)
    }

    func setupEnergyView() {
        energyView1.setupView(energy: "16.4 kwh", devices: "3 Device Turn On")
    }
    
    @objc private func devicesLabelTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        let title = titles[indexPath.item]
        let imageName = images[indexPath.item]
        cell.configure(title: title, imageName: imageName)
        return cell
    }
}
