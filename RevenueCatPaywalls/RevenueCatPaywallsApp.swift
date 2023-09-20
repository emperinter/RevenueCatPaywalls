//
//  RevenueCatPaywallsApp.swift
//  RevenueCatPaywalls
//
//  Created by emperinter on 2023/9/20.
//

import SwiftUI
import StoreKit
import RevenueCat


@main
struct RevenueCatPaywallsApp: App {
    
    init() {
        // Configure RevenueCat Purchases
        Purchases.logLevel = .debug
        Purchases.configure(with: Configuration
            .builder(withAPIKey: Constants.apiKey)
            .with(usesStoreKit2IfAvailable: true)
            .build())
    }
    
    var body: some Scene {
        WindowGroup {
            RevenueCat()
        }
    }
}
