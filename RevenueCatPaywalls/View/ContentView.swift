//
//  ContentView.swift
//  RevenueCatPaywalls
//
//  Created by emperinter on 2023/9/20.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct RevenueCat: View {
    @State private var displayPaywall = false
      @State private var customerInfo: CustomerInfo? // Store customerInfo here

      var body: some View {
          VStack {
              Button(action: {
                  self.displayPaywall = true
              }) {
                  Text("Purchases")
              }
              .sheet(isPresented: self.$displayPaywall) {
                  PaywallView()
                      .toolbar {
                          ToolbarItem(placement: .navigationBarLeading) {
                              Button(action: {
                                  self.displayPaywall = false
                              }) {
                                  Image(systemName: "xmark")
                                      .foregroundColor(.black) // Set the image color
                              }
                          }
                      }
              }

              // Display customerInfo if available
              if let customerInfo = customerInfo {
                  Text("Original App User ID: \(customerInfo.originalAppUserId)")
                  Text("Active Subscriptions: \(customerInfo.activeSubscriptions.description)")
              }
          }
          .onAppear {
              // Fetch customerInfo when the view appears
              Task {
                  do {
                      self.customerInfo = try await Purchases.shared.customerInfo()
                      print("Customer Info: \(String(describing: self.customerInfo))")
                  } catch {
                      print("Error fetching customer info: \(error)")
                  }
              }
          }
      }
}

struct RevenueCat_Previews: PreviewProvider {
    static var previews: some View {
        RevenueCat()
    }
}
