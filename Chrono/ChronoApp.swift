//
//  ChronoApp.swift
//  Chrono
//
//  Created by Andre Mulaja on 2022-04-29.
//

import SwiftUI

@main
struct ChronoApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
