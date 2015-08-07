//
//  UIImage+Extension.swift
//  Icon
//
//  Created by Victor Chee on 15/5/31.
//  Copyright (c) 2015年 VictorChee. All rights reserved.
//

import UIKit

extension UIImage {
    func resize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
