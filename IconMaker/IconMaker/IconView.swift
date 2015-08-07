//
//  IconView.swift
//  Icon
//
//  Created by qihaijun on 5/27/15.
//  Copyright (c) 2015 VictorChee. All rights reserved.
//

import UIKit

class IconView: UIView {
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        let startColor = UIColor(hex: 0xFF5B37)
        let startColorComponents = CGColorGetComponents(startColor.CGColor)
        let endColor = UIColor(hex: 0xFB2B69)
        let endColorComponents = CGColorGetComponents(endColor.CGColor)
        let locationsCount: Int = 2
        let locations: [CGFloat] = [0.0, 1.0]
        let components: [CGFloat] = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3],
            endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, locationsCount)
        
        // radial gradient
//        CGContextSaveGState(context)
//        CGContextDrawRadialGradient(context, gradient, center, CGFloat(0.0), center, bounds.size.width/2.0*sqrt(2.0), CGGradientDrawingOptions(1))
//        CGContextRestoreGState(context)
        
        // linear gradient
//        CGContextSaveGState(context)
//        CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetWidth(bounds)/2.0, 0), CGPointMake(CGRectGetWidth(bounds)/2.0, CGRectGetHeight(bounds)), CGGradientDrawingOptions(0))
//        CGContextRestoreGState(context)
        
        CGContextSaveGState(context)
        let baseRadius = frame.width/3.8
        let radius = (1.0/2.0 + sqrt(2.0)/4.0) * baseRadius
        let width = (1.0 - sqrt(2.0)/2.0) * baseRadius
        let bezier = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI*2), clockwise: true)
        CGContextAddPath(context, bezier.CGPath)
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextSetLineWidth(context, width)
        CGContextStrokePath(context)
        CGContextRestoreGState(context)
    }
}
