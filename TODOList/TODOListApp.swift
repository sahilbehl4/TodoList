//
//  TODOListApp.swift
//  TODOList
//
//  Created by Sahil Behl on 3/21/23.
//

import SwiftUI

@main
struct TODOListApp: App {
    let persistenceContainer = PersistenceContainer.shared
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
