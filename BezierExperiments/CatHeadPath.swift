//
//  CatHeadPath.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/22/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class CatHeadPath: UIBezierPath {

    init(zeroPoint zPoint: CGPoint, shapeSideLength sideLength: CGFloat, earRadius: CGFloat) {
        super.init()
        let topRightBeforeEar = CGPoint(x: zPoint.x + sideLength - earRadius, y: zPoint.y + earRadius)
        let bottomRightBeforeChin = CGPoint(x: zPoint.x + sideLength, y: zPoint.y + sideLength/1.5)
        
        addArcWithCenter(CGPoint(x: zPoint.x, y: zPoint.y + earRadius), radius: earRadius, startAngle: CGFloat(M_PI + M_PI_2), endAngle: CGFloat(2 * M_PI), clockwise: true)
        addLineToPoint(topRightBeforeEar)
        addArcWithCenter(CGPoint(x: zPoint.x + sideLength, y: zPoint.y + earRadius), radius: earRadius, startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI + M_PI_2), clockwise: true)
        addLineToPoint(bottomRightBeforeChin)
        addArcWithCenter(CGPoint(x: zPoint.x + sideLength/2, y: zPoint.y + sideLength/1.5), radius: sideLength/2, startAngle: CGFloat(2 * M_PI), endAngle: CGFloat(M_PI), clockwise: true)
        
        closePath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
