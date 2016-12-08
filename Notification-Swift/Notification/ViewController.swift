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

        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let configLabel = UILabel(frame: CGRect(x: 0, y: 54, width: width, height: 44))
        configLabel.textAlignment = .center
        configLabel.text = "ConfigSetting"
        self.view .addSubview(configLabel)
        
        // ImageView
        imageView = UIImageView(frame: CGRect(x: (width-300), y: 20, width: 300, height: 300));
        imageView?.center = CGPoint(x: width/2.0, y: height/2.0-64)
        imageView?.image = UIImage(named: "notification")
        self.view.addSubview(imageView!)
        
        // Button
        let imageViewHeight = imageView?.bounds.size.height
        let saveButton = UIButton(type:.system);
        saveButton.frame = CGRect(x: 0, y: (imageView?.frame.origin.y)! + imageViewHeight!, width: 80, height: 44);
        saveButton.center = CGPoint(x: (imageView?.center.x)!, y: saveButton.center.y)
        saveButton.setTitle("Save", for: UIControlState())
        saveButton.addTarget(self, action: #selector(ViewController.tapSaveImageToIphone), for: .touchUpInside)
        self.view .addSubview(saveButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tapSaveImageToIphone(){
       UIImageWriteToSavedPhotosAlbum(self.imageView!.image!, self, #selector(ViewController.saveImageComplete(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func saveImageComplete(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer)       {
        if  error == nil{
            let alert = UIAlertView(title: "Tips", message: "Has been saved to the album", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
            alert.show()
        }else{
            let alert = UIAlertView(title: "Tips", message: "Failure", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
            alert.show()
        }
    }
}

