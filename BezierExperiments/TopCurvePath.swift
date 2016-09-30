//
//  TopCurvePath.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/22/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class TopCurvePath: UIBezierPath {

    init(zeroPoint zPoint: CGPoint, shapeSideLength sideLength: CGFloat) {
        super.init()
        let curveHeight: CGFloat = 35.0
        
        let bottomLeft = CGPoint(x: zPoint.x, y: zPoint.y + sideLength)
        let bottomRight = CGPoint(x: zPoint.x + sideLength, y: zPoint.y + sideLength)
        
        let topLeftBeforeCurve = CGPoint(x: zPoint.x, y: zPoint.y + curveHeight)
        let topRightAfterCurve = CGPoint(x: zPoint.x + sideLength, y: zPoint.y + curveHeight)
        
        move(to: bottomLeft)
        addLine(to: topLeftBeforeCurve)
        
        let controlPoint1 = CGPoint(x: zPoint.x + sideLength/3, y: zPoint.y + curveHeight/2)
        let controlPoint2 = CGPoint(x: zPoint.x + sideLength/3 * 2, y: zPoint.y + curveHeight/2)
        
        addCurve(to: topRightAfterCurve, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        addLine(to: bottomRight)
        
        close()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
