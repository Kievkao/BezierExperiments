//
//  DrawVC.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/21/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class DrawVC: UIViewController {

    var demoType: BezierDemoType?
    
    let zeroPoint = CGPoint(x: 100, y: 100)
    let sideLength: CGFloat = 150.0
    let lineWidth: CGFloat = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDraw()
    }
    
    func setupDraw() {
        guard let demoType = self.demoType else { return }
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.whiteColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.lineWidth = lineWidth
        
        switch demoType {
        case .TopRoundedCorners:
            layer.path = TopRoundedCornersPath(zeroPoint: zeroPoint, cornerRadius: 25, shapeSideLength: sideLength).CGPath
            
        case .TopArc:
            layer.path = TopArcPath(zeroPoint: zeroPoint, shapeSideLength: sideLength).CGPath
            
        case .TopCurve:
            layer.path = TopCurvePath(zeroPoint: zeroPoint, shapeSideLength: sideLength).CGPath
            
        case .CatHead:
            layer.path = CatHeadPath(zeroPoint: zeroPoint, shapeSideLength: sideLength, earRadius: 40).CGPath
            
        case .MickeyMouse:
            layer.path = MickeyMousePath(zeroPoint: zeroPoint, shapeSideLength: sideLength, earRadius: 45).CGPath
        }
        
        view.layer.addSublayer(layer)
    }
}

