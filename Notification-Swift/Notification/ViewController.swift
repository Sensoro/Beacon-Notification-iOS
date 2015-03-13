//
//  ViewController.swift
//  Notification
//
//  Created by skyming on 15/3/12.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIAlertViewDelegate {

    var imageView:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()

        var width = UIScreen.mainScreen().bounds.width
        var height = UIScreen.mainScreen().bounds.height
        
        var configLabel = UILabel(frame: CGRectMake(0, 54, width, 44))
        configLabel.textAlignment = .Center
        configLabel.text = "ConfigSetting"
        self.view .addSubview(configLabel)
        
        // ImageView
        imageView = UIImageView(frame: CGRectMake((width-300), 20, 300, 300));
        imageView?.center = CGPointMake(width/2.0, height/2.0-64)
        imageView?.image = UIImage(named: "notification")
        self.view.addSubview(imageView!)
        
        // Button
        var imageViewHeight = imageView?.bounds.size.height
        var saveButton: UIButton  = UIButton.buttonWithType(.System) as UIButton;
        saveButton.frame = CGRectMake(0, (imageView?.frame.origin.y)! + imageViewHeight!, 80, 44);
        saveButton.center = CGPointMake((imageView?.center.x)!, saveButton.center.y)
        saveButton.setTitle("Save", forState: .Normal)
        saveButton.addTarget(self, action: Selector("tapSaveImageToIphone"), forControlEvents: .TouchUpInside)
        self.view .addSubview(saveButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tapSaveImageToIphone(){
       UIImageWriteToSavedPhotosAlbum(self.imageView!.image, self, Selector("saveImageComplete:didFinishSavingWithError:contextInfo:"), nil)
    }
    
    func saveImageComplete(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>)       {
        if  error == nil{
            var alert = UIAlertView(title: "Tips", message: "Has been saved to the album", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
            alert.show()
        }else{
            var alert = UIAlertView(title: "Tips", message: "Failure", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
            alert.show()
        }
    }
}

