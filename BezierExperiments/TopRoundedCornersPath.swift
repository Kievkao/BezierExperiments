//
//  TopRoundedCornersPath.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/22/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class TopRoundedCornersPath: UIBezierPath {
    
    init(zeroPoint zPoint: CGPoint, cornerRadius: CGFloat, shapeSideLength sideLength: CGFloat) {
        super.init()
        let bottomLeft = CGPoint(x: zPoint.x, y: zPoint.y + sideLength)
        let bottomRight = CGPoint(x: zPoint.x + sideLength, y: zPoint.y + sideLength)
        
        move(to: bottomLeft)
        addArc(withCenter: CGPoint(x: zPoint.x + cornerRadius, y: zPoint.y + cornerRadius), radius: cornerRadius, startAngle: CGFloat(M_PI), endAngle: CGFloat(3 * M_PI_2), clockwise: true)
        addArc(withCenter: CGPoint(x: zPoint.x + sideLength - cornerRadius, y: zPoint.y + cornerRadius), radius: cornerRadius, startAngle: CGFloat(3 * M_PI_2), endAngle: CGFloat(2 * M_PI), clockwise: true)
        addLine(to: bottomRight)
        
        close()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
