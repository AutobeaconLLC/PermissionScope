//
//  Permissions.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/25/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import Foundation
import CoreLocation
import AVFoundation
import CoreBluetooth

/**
*  Protocol for permission configurations.
*/
@objc public protocol Permission {
    /// Permission type
    var type: PermissionType { get }
}

@objc public class NotificationsPermission: NSObject, Permission {
    public let type: PermissionType = .notifications
    public let notificationCategories: Set<UIUserNotificationCategory>?
    
    public init(notificationCategories: Set<UIUserNotificationCategory>? = nil) {
        self.notificationCategories = notificationCategories
    }
}

@objc public class LocationWhileInUsePermission: NSObject, Permission {
    public let type: PermissionType = .locationInUse
}

@objc public class LocationAlwaysPermission: NSObject, Permission {
    public let type: PermissionType = .locationAlways
}

public typealias requestPermissionUnknownResult = () -> Void
public typealias requestPermissionShowAlert     = (PermissionType) -> Void

@objc public class MicrophonePermission: NSObject, Permission {
    public let type: PermissionType = .microphone
}

@objc public class CameraPermission: NSObject, Permission {
    public let type: PermissionType = .camera
}

@objc public class BluetoothPermission: NSObject, Permission {
    public let type: PermissionType = .bluetooth
}
