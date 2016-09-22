//
//  TopArcPath.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/22/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class TopArcPath: UIBezierPath {

    init(zeroPoint zPoint: CGPoint, shapeSideLength sideLength: CGFloat) {
        super.init()
        let halfSideLength = sideLength / 2
        let bottomLeft = CGPoint(x: zPoint.x, y: zPoint.y + sideLength)
        let bottomRight = CGPoint(x: zPoint.x + sideLength, y: zPoint.y + sideLength)
        
        moveToPoint(bottomLeft)
        addArcWithCenter(CGPoint(x: zPoint.x + halfSideLength, y: zPoint.y + halfSideLength), radius: halfSideLength, startAngle: CGFloat(M_PI), endAngle: CGFloat(2 * M_PI), clockwise: true)
        addLineToPoint(bottomRight)
        
        closePath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
