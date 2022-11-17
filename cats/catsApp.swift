//
//  catsApp.swift
//  cats
//
//  Created by Veronica Tellez on 17/11/22.
//

import SwiftUI

@main
struct catsApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
