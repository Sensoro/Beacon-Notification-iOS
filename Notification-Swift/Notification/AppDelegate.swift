//
//  AppDelegate.swift
//  Notification
//
//  Created by skyming on 15/3/12.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager:CLLocationManager?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        locationManager = CLLocationManager()
        locationManager?.delegate = self

        // request authorization to track the user’s location
        locationManager?.requestAlwaysAuthorization()
        
        if((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0){
            
            UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes:(.Alert | .Sound | .Badge), categories: nil))

            UIApplication.sharedApplication().registerForRemoteNotifications()

        }else{
        
            UIApplication.sharedApplication().registerForRemoteNotificationTypes((.Alert | .Sound | .Badge))
        }
        return true
    }


    func applicationDidEnterBackground(application: UIApplication) {
        
        var messageString = "欢迎进入Sensoro" as NSString
        var notification = UILocalNotification()
        notification.alertBody = messageString
        notification.region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "23A01AF0-232A-4518-9C0E-323FB773F5EF"), major: 0x8888, minor: 0x8888, identifier: "SensoroTest")
        notification.regionTriggersOnce = false
        notification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if(status == .AuthorizedAlways){
            println("已获得授权")
        }
    }

    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("进入")
    }
}

