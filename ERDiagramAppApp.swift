//
//  ERDiagramAppApp.swift
//  ERDiagramApp
//
//  Created by Biba on 19.06.2024.
//

import SwiftUI
import CoreData

@main
struct ERDiagramAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
