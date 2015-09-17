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
    
    @IBOutlet weak var faviconView: FaviconView!
    @IBOutlet weak var faviconLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        faviconLabel.font = UIFont.systemFontOfSize(500)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        saveIcons()
        saveFavicons()
    }
    
    func saveIcons() {
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
    
    func saveFavicons() {
        let originalImage = captureView(faviconView);
        saveToDocument(originalImage, name: "1024") // 1024
        saveToDocument(originalImage.resize(CGSizeMake(57, 57)), name: "apple-icon-57x57")
        saveToDocument(originalImage.resize(CGSizeMake(60, 60)), name: "apple-icon-60x60")
        saveToDocument(originalImage.resize(CGSizeMake(72, 72)), name: "apple-icon-72x72")
        saveToDocument(originalImage.resize(CGSizeMake(76, 76)), name: "apple-icon-76x76")
        saveToDocument(originalImage.resize(CGSizeMake(114, 114)), name: "apple-icon-114x114")
        saveToDocument(originalImage.resize(CGSizeMake(120, 120)), name: "apple-icon-120x120")
        saveToDocument(originalImage.resize(CGSizeMake(144, 144)), name: "apple-icon-144x144")
        saveToDocument(originalImage.resize(CGSizeMake(152, 152)), name: "apple-icon-152x152")
        saveToDocument(originalImage.resize(CGSizeMake(180, 180)), name: "apple-icon-180x180")
        saveToDocument(originalImage.resize(CGSizeMake(16, 16)), name: "favicon-16x16")
        saveToDocument(originalImage.resize(CGSizeMake(32, 32)), name: "favicon-32x32")
        saveToDocument(originalImage.resize(CGSizeMake(96, 96)), name: "favicon-96x96")
        saveToDocument(originalImage.resize(CGSizeMake(192, 192)), name: "favicon-192x192")
    }
    
    func captureView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        let context = UIGraphicsGetCurrentContext()
        view.layer.renderInContext(context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func saveToDocument(image: UIImage, name: String) {
        let data = UIImagePNGRepresentation(image)
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        if let url = urls.first?.URLByAppendingPathComponent(name + ".png") {
            data?.writeToURL(url, atomically: true)
        }
    }
}

