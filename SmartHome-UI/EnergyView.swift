import UIKit

class EnergyView: UIView {
    
  @IBOutlet private weak var energyLabel: UILabel!
  @IBOutlet private weak var kWhLabel: UILabel!
  @IBOutlet private weak var devicesLabel: UILabel!
  @IBOutlet private weak var iconImageView: UIImageView!
    override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = 20 
            self.layer.masksToBounds = true
            applyGradient(to: self)
        }
    override init(frame: CGRect) {
           super.init(frame: frame)
       }
    required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    override func awakeFromNib() {
           super.awakeFromNib()
           
       }
    func setupView(energy: String, devices: String) {
            energyLabel.text = "Energy"
            kWhLabel.text = energy
            devicesLabel.text = devices
        }
    }
