//
//  ViewController.swift
//  PermissionScope-example
//
//  Created by Nick O'Neill on 4/5/15.
//  Copyright (c) 2015 That Thing in Swift. All rights reserved.
//

import UIKit
import PermissionScope

class ViewController: UIViewController {
    let singlePscope = PermissionScope()
    let multiPscope = PermissionScope()
    let multiPscope2 = PermissionScope()
    let multiPscope3 = PermissionScope()

    let noUIPscope = PermissionScope()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        singlePscope.addPermission(NotificationsPermission(notificationCategories: nil),
            message: "We use this to send you\r\nspam and love notes")

        multiPscope.addPermission(NotificationsPermission(notificationCategories: nil),
            message: "We use this to send you\r\nspam and love notes")
        multiPscope.addPermission(LocationAlwaysPermission(),
            message: "We use this to always track\r\nwhere you live")
        multiPscope.addPermission(LocationWhileInUsePermission(),
                                  message: "We use this to sometimes track\r\nwhere you live")

        multiPscope2.addPermission(CameraPermission(),
                                  message: "We are also watching you while you sleep")
        multiPscope2.addPermission(PhotosPermission(),
                                  message: "We use this to find some compromising evidence agaisnt you")

        // Other example permissions
        multiPscope3.addPermission(MicrophonePermission(),message: "We can hear you")
        multiPscope3.addPermission(BluetoothPermission(), message: "We use this to drain your battery")

        noUIPscope.addPermission(NotificationsPermission(notificationCategories: nil), message: "notifications")
        noUIPscope.addPermission(MicrophonePermission(), message: "microphone")
        noUIPscope.onAuthChange = {
            (finished, results) in
            print("auth change",finished,results)
        }
    }
    
    // an example of how to use the unified permissions API
//    func checkContacts() {
//        switch PermissionScope().statusContacts() {
//        case .unknown:
//            // ask
//            PermissionScope().requestContacts()
//        case .unauthorized, .disabled:
//            // bummer
//            return
//        case .authorized:
//            // thanks!
//            return
//        }
//    }
    
    @IBAction func singlePerm() {
        singlePscope.show(
            { finished, results in
                print("got results \(results)")
            },
            cancelled: { results in
                print("thing was cancelled")
            }
        )
    }
    
    @IBAction func multiPerms() {
        multiPscope.show(
            { finished, results in
                print("got results \(results)")
            },
            cancelled: { results in
                print("thing was cancelled")
            }
        )
    }

    @IBAction func multiPerms2(_ sender: Any) {
        multiPscope2.show(
            { finished, results in
                print("got results \(results)")
        },
            cancelled: { results in
                print("thing was cancelled")
        }
        )
    }

    @IBAction func multiPerms3(_ sender: Any) {
        multiPscope3.show(
            { finished, results in
                print("got results \(results)")
        },
            cancelled: { results in
                print("thing was cancelled")
        }
        )
    }
    @IBAction func noUIPerm() {
        noUIPscope.requestNotifications()
    }
}

