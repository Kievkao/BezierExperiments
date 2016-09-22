//
//  MickeyMousePath.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/22/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class MickeyMousePath: UIBezierPath {

    init(zeroPoint zPoint: CGPoint, shapeSideLength sideLength: CGFloat, earRadius: CGFloat) {
        super.init()
        let headCenter = CGPoint(x: zPoint.x + sideLength/2, y: zPoint.y + sideLength/2 + earRadius)
        let headRadius = sideLength/2
        
        addArcWithCenter(headCenter, radius: headRadius, startAngle: CGFloat(-M_PI_4/2), endAngle: CGFloat(M_PI + M_PI_4/2), clockwise: true)
        addArcWithCenter(CGPoint(x: zPoint.x, y: zPoint.y + earRadius), radius: earRadius, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(2 * M_PI), clockwise: true)
        
        addArcWithCenter(headCenter, radius: headRadius, startAngle: CGFloat(M_PI + M_PI_4 + M_PI_4/2), endAngle: CGFloat(M_PI + M_PI_2 + M_PI_4/2), clockwise: true)
        addArcWithCenter(CGPoint(x: headCenter.x + headRadius, y: zPoint.y + earRadius), radius: earRadius, startAngle: CGFloat(M_PI), endAngle: CGFloat(2 * M_PI + M_PI_2), clockwise: true)
        
        closePath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
