//
//  NewTaskItemView.swift
//  TODOList
//
//  Created by Sahil Behl on 3/31/23.
//

import SwiftUI

struct NewTaskItemView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @State private var newTask: String = ""
    @FocusState var dismissKeyboard
    @Binding var isShowing: Bool
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        VStack {

            Spacer()
            
            VStack {
                VStack(spacing: 16) {
                    TextField("New Task", text: $newTask)
                        .foregroundColor(.pink)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .focused($dismissKeyboard)
                        .padding()
                        .background(isDarkMode ? Color(UIColor.tertiarySystemBackground): Color(UIColor.secondarySystemBackground))
                        .cornerRadius(12)
                }

                Button(action: addItem, label: {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()

                })
                .disabled(newTask.isEmpty)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(newTask.isEmpty ? Color.blue : Color.pink)
                .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color(UIColor.white))
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
            .onTapGesture {
                if newTask.isEmpty {
                    playSound(sound: "sound-tap", type: "mp3")
                }
            }
        }
        .padding()
    }

    private func addItem() {
        guard !newTask.isEmpty else {
            print("Empty field error")
            return
        }

        playSound(sound: "sound-ding", type: "mp3")
        let newItem = Item(context: viewContext)
        newItem.task = newTask
        newItem.id = UUID()
        newItem.completion = false
        newItem.timeStamp = Date()

        newTask = ""
        dismissKeyboard = false

        do {
            try viewContext.save()
        } catch {
            print("Error: \(error)")
        }
        isShowing = false
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .previewDevice("iPhone 12 Pro")
            .background(Color.gray.ignoresSafeArea(.all))
    }
}
