//
//  GradientView.swift
//  GeekBrains App
//
//  Created by Sanzhar on 22.01.2021.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var endColor: UIColor = .white {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocation()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocation()
        }
    }
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPoint()
        }
    }
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    func updateColors() {
        return self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updateLocation() {
        return self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
