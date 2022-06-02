//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by BS851 on 1/6/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "registerToChat"
    static let loginSegue = "loginToChat"
    static let yesKey = "Yes"
    static let noKey = "No"
    static let logoutKey = "Log Out"
    static let logoutAlertMessage = "Are you sure you want to log out?"
    static let warningKey = "Warning!"
    static let okayKey = "Okay"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
