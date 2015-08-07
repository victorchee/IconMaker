//
//  ViewController.swift
//  IconMaker
//
//  Created by qihaijun on 8/7/15.
//  Copyright (c) 2015 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconView: IconView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let originalImage = captureView(iconView);
        saveToDocument(originalImage, name: "1024") // 1024
        saveToDocument(originalImage.resize(CGSizeMake(29*1, 29*1)), name: "29")
        saveToDocument(originalImage.resize(CGSizeMake(29*2, 29*2)), name: "29@2x")
        saveToDocument(originalImage.resize(CGSizeMake(29*3, 29*3)), name: "29@3x")
        saveToDocument(originalImage.resize(CGSizeMake(40*1, 40*1)), name: "40")
        saveToDocument(originalImage.resize(CGSizeMake(40*2, 40*2)), name: "40@2x")
        saveToDocument(originalImage.resize(CGSizeMake(40*3, 40*3)), name: "40@3x")
        saveToDocument(originalImage.resize(CGSizeMake(50*1, 50*1)), name: "50")
        saveToDocument(originalImage.resize(CGSizeMake(50*2, 50*2)), name: "50@2x")
        saveToDocument(originalImage.resize(CGSizeMake(57*1, 57*1)), name: "57")
        saveToDocument(originalImage.resize(CGSizeMake(57*2, 57*2)), name: "57@2x")
        saveToDocument(originalImage.resize(CGSizeMake(60*2, 60*2)), name: "60@2x")
        saveToDocument(originalImage.resize(CGSizeMake(60*3, 60*3)), name: "60@3x")
        saveToDocument(originalImage.resize(CGSizeMake(72*1, 72*1)), name: "72")
        saveToDocument(originalImage.resize(CGSizeMake(72*2, 72*2)), name: "72@2x")
        saveToDocument(originalImage.resize(CGSizeMake(76*1, 76*1)), name: "76")
        saveToDocument(originalImage.resize(CGSizeMake(76*2, 76*2)), name: "76@2x")
    }
    
    func captureView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        let context = UIGraphicsGetCurrentContext()
        view.layer.renderInContext(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func saveToDocument(image: UIImage, name: String) {
        let data = UIImagePNGRepresentation(image)
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let path = paths.first?.stringByAppendingPathComponent(name + ".png")
        data.writeToFile(path!, atomically: true)
    }
}

