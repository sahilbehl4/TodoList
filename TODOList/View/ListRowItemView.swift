//
//  ListRowItemView.swift
//  TODOList
//
//  Created by Sahil Behl on 3/31/23.
//

import SwiftUI

struct ListRowItemView: View {

    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item

    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical , 12)
        }
        .toggleStyle(CheckBoxStyle())
        .onReceive(item.objectWillChange) { _ in
            if viewContext.hasChanges {
                try? viewContext.save()
            }
        }
    }
}
