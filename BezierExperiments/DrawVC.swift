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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDraw()
    }
    
    func setupDraw() {
        guard let demoType = self.demoType else { return }
        
        switch demoType {
        case .TopRoundedCorners:
            addPathToDemoLayer(TopRoundedCornersPath(zeroPoint: zeroPoint, cornerRadius: 25, shapeSideLength: sideLength))
            
        case .TopArc:
            addPathToDemoLayer(TopArcPath(zeroPoint: zeroPoint, shapeSideLength: sideLength))
            
        case .TopCurve:
            addPathToDemoLayer(TopCurvePath(zeroPoint: zeroPoint, shapeSideLength: sideLength))
            
        case .CatHead:
            addPathToDemoLayer(CatHeadPath(zeroPoint: zeroPoint, shapeSideLength: sideLength, earRadius: 40))
            
        case .MickeyMouse:
            addPathToDemoLayer(MickeyMousePath(zeroPoint: zeroPoint, shapeSideLength: sideLength, earRadius: 45))
        
        case .AnimatePath:
            let path = AnimationPath(zeroPoint: zeroPoint, shapeSideLength: sideLength)
            
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = 4.0
            
            let square = UIView(frame: CGRect(x: 20, y: 100, width: 50, height: 50))
            square.backgroundColor = UIColor.redColor()
            view.addSubview(square)
            
            square.layer.addAnimation(anim, forKey: "bezierAnim")
        }
    }
    
    func addPathToDemoLayer(path: UIBezierPath) {
        let layer = DemoLayer()
        layer.path = path.CGPath
        
        view.layer.addSublayer(layer)
    }
}

class DemoLayer: CAShapeLayer {
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        fillColor = UIColor.whiteColor().CGColor
        strokeColor = UIColor.blackColor().CGColor
        lineWidth = 3.0
    }
}

