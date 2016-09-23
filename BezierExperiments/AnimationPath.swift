//
//  AnimationPath.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/23/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class AnimationPath: UIBezierPath {
    
    init(zeroPoint zPoint: CGPoint, shapeSideLength sideLength: CGFloat) {
        super.init()
        
        moveToPoint(zPoint)
        
        let animationFinishPoint = CGPoint(x: zPoint.x + sideLength, y: zPoint.y + sideLength)
        let randomPoint1 = randomPoint(minX: zPoint.x, maxX: zPoint.x + sideLength, minY: zPoint.y, maxY: zPoint.y + sideLength)
        let randomPoint2 = randomPoint(minX: zPoint.x, maxX: zPoint.x + sideLength, minY: zPoint.y, maxY: zPoint.y + sideLength)
        
        addCurveToPoint(animationFinishPoint, controlPoint1: randomPoint1, controlPoint2: randomPoint2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func randomPoint(minX minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> CGPoint {
        return CGPoint(x: Int(arc4random_uniform(UInt32(maxX)) + UInt32(minX)), y: Int(arc4random_uniform(UInt32(maxY)) + UInt32(minY)))
    }
}
