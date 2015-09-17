//
//  FaviconView.swift
//  IconMaker
//
//  Created by Victor Chee on 15/8/19.
//  Copyright (c) 2015年 VictorChee. All rights reserved.
//

import UIKit

class FaviconView: UIView {
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        let startColor = UIColor(hex: 0xFFDB4C)
        let startColorComponents = CGColorGetComponents(startColor.CGColor)
        let endColor = UIColor(hex: 0xFFCD02)
        let endColorComponents = CGColorGetComponents(endColor.CGColor)
        let locationsCount: Int = 2
        let locations: [CGFloat] = [0.0, 1.0]
        let components: [CGFloat] = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3],
            endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, locationsCount)
        
        // radial gradient
        //        CGContextSaveGState(context)
        //        CGContextDrawRadialGradient(context, gradient, center, CGFloat(0.0), center, bounds.size.width/2.0*sqrt(2.0), CGGradientDrawingOptions(1))
        //        CGContextRestoreGState(context)
        
        // linear gradient
        CGContextSaveGState(context)
        CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetWidth(bounds)/2.0, 0), CGPointMake(CGRectGetWidth(bounds)/2.0, CGRectGetHeight(bounds)), CGGradientDrawingOptions(rawValue: 0))
        CGContextRestoreGState(context)
    }
    
}
