//
//  AppDelegate.swift
//  Notification
//
//  Created by skyming on 15/3/12.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager:CLLocationManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        locationManager = CLLocationManager()
        locationManager?.delegate = self

        // request authorization to track the user’s location
        
        if #available(iOS 10,*) {
//            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types:[.alert, .sound, .badge], categories: nil))
//            UIApplication.shared.registerForRemoteNotifications()
//            
            locationManager?.requestWhenInUseAuthorization();
            let center = UNUserNotificationCenter.current();
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                // Enable or disable features based on authorization
            }
            
        } else if #available(iOS 8,*){
            locationManager?.requestAlwaysAuthorization()
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types:[.alert, .sound, .badge], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }else{
            locationManager?.requestAlwaysAuthorization()
            UIApplication.shared.registerForRemoteNotifications(matching: [.alert, .sound, .badge])
        }
        
        UIApplication.shared.cancelAllLocalNotifications()
        
        return true
    }


    func applicationDidEnterBackground(_ application: UIApplication) {
        // 进场
        scheduleLocalNotification(true, tips: "欢迎进入")

        // 离场
        scheduleLocalNotification(false, tips: "谢谢光临")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0;
    }
    
    func scheduleLocalNotification(_ onEntry:Bool, tips:String!){
        
        if #available(iOS 10,*) {
            let content = UNMutableNotificationContent();
            content.title = "Sensoro";
            content.body = String(format: "%@Sensoro-Swift", tips);
            content.sound = UNNotificationSound.default();
            
            let region = CLBeaconRegion(proximityUUID: UUID(uuidString: "23A01AF0-232A-4518-9C0E-323FB773F5EF")!,
                                        major: 0x8888, minor: 0x8888, identifier: tips)
            region.notifyOnEntry = onEntry
            region.notifyOnExit = !onEntry;
            let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
            
            let notification = UNNotificationRequest(identifier: tips, content: content,trigger: trigger);
//            notification.
            
            let center = UNUserNotificationCenter.current();
            
            center.add(notification);
        }else{
            let messageString = String(format: "%@Sensoro-Swift", tips)
            let notification = UILocalNotification()
            notification.alertBody = messageString
            notification.region = CLBeaconRegion(proximityUUID: UUID(uuidString: "23A01AF0-232A-4518-9C0E-323FB773F5EF")!,
                                                 major: 0x8888, minor: 0x8888, identifier: tips)
            
            notification.region?.notifyOnEntry = onEntry
            notification.region?.notifyOnExit = !onEntry
            notification.regionTriggersOnce = false
            
            notification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
            notification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == .authorizedAlways){
            print("已获得授权")
        }
    }


}

