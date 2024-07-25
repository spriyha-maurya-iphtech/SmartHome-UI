import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deviceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
    }
    func configure(title: String, imageName: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageName)
    }
    private func setupAppearance() {
        
        self.contentView.layer.cornerRadius = 25
        
        self.contentView.layer.masksToBounds = true
        contentView.layer.borderColor = UIColor.black
     .cgColor
      contentView.layer.borderWidth = 1.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius)
        self.layer.shadowPath = shadowPath.cgPath
    }
     override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius)
        self.layer.shadowPath = shadowPath.cgPath
    }
}
