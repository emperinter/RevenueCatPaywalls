//
//  RevenueCatPaywallsApp.swift
//  RevenueCatPaywalls
//
//  Created by emperinter on 2023/9/20.
//

import SwiftUI

@main
struct RevenueCatPaywallsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
