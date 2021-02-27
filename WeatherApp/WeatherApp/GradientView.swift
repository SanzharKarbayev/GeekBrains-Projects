//
//  GradientView.swift
//  WeatherApp
//
//  Created by Sanzhar on 25.01.2021.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
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
            self.updateLocations()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
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
    
    private func updateColors() {
        return self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    private func updateLocations() {
        return self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }

    private func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    private func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
}
