//
//  EditView.swift
//  TodoList
//
//  Created by MaxMobile on 05/09/2022.
//

import SwiftUI

struct EditView: View {
    
    @State var contentEdit: String = ""
    @State var taskEdit: String = ""
    @State var contentSaved: String = ""
    @State var taskSaved: String = ""
    @ObservedObject var listNote: ListNote
    var toDoNote: Note
    
    var body: some View {
        NavigationView {
            VStack {
                VStack (spacing: 20) {
                    TextField("Edit task: ", text: self.$contentEdit)
                    TextField("Edit content: ", text: self.$taskEdit)
                }
                Button(action: {
                    contentSaved = contentEdit
                    taskSaved = taskEdit
                    let _: Note = Note(title: taskSaved, content: contentSaved, last_edition: Date())
                    listNote.editNote(newC: contentSaved, newT: taskSaved, id: toDoNote.id)
                },
                       label: {
                    Text("Change".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Text(contentSaved)
                Text(taskSaved)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Edit!")
        .onAppear(perform: {
            contentEdit = toDoNote.content
            taskEdit = toDoNote.title
            print("toDoNote: \(toDoNote)")
            print("Title: \(toDoNote.title)")
            print("Content: \(toDoNote.content)")

        })
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
