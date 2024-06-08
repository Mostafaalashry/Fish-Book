//
//  AppDelegate.swift
//  Fish Book
//
//  Created by mostafa on 08/06/2024.
//

import Foundation

import UIKit
import IQKeyboardManagerSwift

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        return true
    }
}
