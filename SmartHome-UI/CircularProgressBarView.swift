import UIKit

class CircularProgressBar: UIView {
    
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private var tickLayer = CAShapeLayer()
    private var degreeLabel = UILabel()
    
    var progressColor: UIColor? {
        didSet {
            if let gradientColor = progressColor {
                progressLayer.strokeColor = gradientColor.cgColor
            }
        }
    }
    
    var trackColor = UIColor.lightGray {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    var tickColor = UIColor.darkGray {
        didSet {
            tickLayer.strokeColor = tickColor.cgColor
        }
    }
    
    var progress: CGFloat = 0 {
        didSet {
            progressLayer.strokeEnd = progress
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularPath()
        setupDegreeLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCircularPath()
        setupDegreeLabel()
    }
    
    private func setupCircularPath() {
        let radius: CGFloat = 135 // Adjusted radius for a larger circle
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2), radius: radius, startAngle: 1.25 * -.pi, endAngle: 1.5 * .pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 15 // Adjust line width if needed
        trackLayer.strokeEnd = 1
        layer.addSublayer(trackLayer)
        
        let gradientLayer = getGradientLayer(bounds: bounds)
        if let gradientColor = gradientColor(bounds: bounds, gradientLayer: gradientLayer) {
            progressLayer.strokeColor = gradientColor.cgColor
        }
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = 15 // Adjust line width if needed
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
        
        drawTickMarks(radius: radius + 25) // Adjust radius to position tick marks outside the progress circle
    }
    
    private func setupDegreeLabel() {
        degreeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        degreeLabel.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        degreeLabel.textAlignment = .center
        degreeLabel.textColor = .gray
        degreeLabel.font = UIFont.systemFont(ofSize: 70, weight: .bold) // Adjust font size if needed
        degreeLabel.text = "16°"
        addSubview(degreeLabel)
    }
    
    private func drawTickMarks(radius: CGFloat) {
        tickLayer.strokeColor = tickColor.cgColor
        tickLayer.lineWidth = 2
        tickLayer.fillColor = UIColor.clear.cgColor
        
        let tickPath = UIBezierPath()
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let tickLength: CGFloat = 10
        
        for i in 0..<100 {
            let angle = (CGFloat(i) * .pi / 50) - .pi / 2
            let start = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
            let end = CGPoint(x: center.x + (radius - tickLength) * cos(angle), y: center.y + (radius - tickLength) * sin(angle))
            tickPath.move(to: start)
            tickPath.addLine(to: end)
        }
        
        tickLayer.path = tickPath.cgPath
        layer.addSublayer(tickLayer)
    }
    
    func setProgress(to progressConstant: CGFloat, withAnimation: Bool) {
        var progress: CGFloat {
            get {
                return self.progress
            }
            set {
                if newValue > 1.0 {
                    self.progress = 1.0
                } else if newValue < 0.0 {
                    self.progress = 0.0
                } else {
                    self.progress = newValue
                }
            }
        }
        
        progress = progressConstant
        if withAnimation {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 1.5
            animation.fromValue = 0
            animation.toValue = progress
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            progressLayer.add(animation, forKey: "animateProgress")
        } else {
            progressLayer.strokeEnd = progress
        }
    }
    
    
    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }
    
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image!)
    }
}
