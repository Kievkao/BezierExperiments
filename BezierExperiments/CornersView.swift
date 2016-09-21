//
//  CornersView.swift
//  BezierExperiments
//
//  Created by Kravchenko, Andrii on 9/21/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit

class CornersView: UIView {
    
    let zeroPoint = CGPoint(x: 50, y: 50)
    let sideLength: CGFloat = 150.0
    
    let lineWidth: CGFloat = 3.0
    
    private func setupColors() {
        UIColor.whiteColor().setStroke()
        UIColor.blackColor().setFill()
    }
    
    override func drawRect(rect: CGRect) {
        setupColors()
        
        drawRectWithTopRoundedCorners()
    }

    func drawRectWithTopArc() {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        
        let halfSideLength = sideLength / 2
        path.moveToPoint(CGPoint(x: zeroPoint.x, y: zeroPoint.y + sideLength))
        path.addLineToPoint(CGPoint(x: zeroPoint.x, y: zeroPoint.y + halfSideLength))
        path.addArcWithCenter(CGPoint(x: zeroPoint.x + halfSideLength, y: zeroPoint.y + halfSideLength), radius: halfSideLength, startAngle: CGFloat(M_PI), endAngle: CGFloat(2 * M_PI), clockwise: true)
        path.addLineToPoint(CGPoint(x: zeroPoint.x + sideLength, y: zeroPoint.y + sideLength))
        path.closePath()
        
        path.fill()
        path.stroke()
    }
    
    func drawRectWithTopRoundedCorners() {
        let cornerRadius: CGFloat = 20.0
        
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        
        path.moveToPoint(CGPoint(x: zeroPoint.x, y: zeroPoint.y + sideLength))
        path.addLineToPoint(CGPoint(x: zeroPoint.x, y: zeroPoint.y + cornerRadius))
        path.addArcWithCenter(CGPoint(x: zeroPoint.x + cornerRadius, y: zeroPoint.y + cornerRadius), radius: cornerRadius, startAngle: CGFloat(M_PI), endAngle: CGFloat(3 * M_PI_2), clockwise: true)
        path.addLineToPoint(CGPoint(x: zeroPoint.x + sideLength - cornerRadius, y: zeroPoint.y))
        path.addArcWithCenter(CGPoint(x: zeroPoint.x + sideLength - cornerRadius, y: zeroPoint.y + cornerRadius), radius: cornerRadius, startAngle: CGFloat(3 * M_PI_2), endAngle: CGFloat(2 * M_PI), clockwise: true)
        path.addLineToPoint(CGPoint(x: zeroPoint.x + sideLength, y: zeroPoint.y + sideLength))
        path.closePath()
        
        path.fill()
        path.stroke()
    }
}
