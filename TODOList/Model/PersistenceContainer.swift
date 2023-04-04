//
//  PersitanceContainer.swift
//  TODOList
//
//  Created by Sahil Behl on 3/22/23.
//

import Foundation
import CoreData

struct PersistenceContainer {
    let container: NSPersistentContainer

    static let shared = PersistenceContainer()

    static var preview: PersistenceContainer = {
        let result = PersistenceContainer(inMemory: true)
        let viewContext = result.container.viewContext
        for index in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timeStamp = Date()
            newItem.task = "Sample task number: \(index)"
            newItem.id = UUID()
            newItem.completion = false
        }

        do {
            try viewContext.save()
        } catch {
            print("Error:\(error)")
        }
        return result
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TodoModel")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Error:\(error)")
            }
        }
    }
}
