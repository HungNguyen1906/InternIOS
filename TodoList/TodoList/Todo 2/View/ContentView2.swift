//
//  ContentView2.swift
//  TodoList
//
//  Created by MaxMobile on 07/09/2022.
//

import SwiftUI
import Foundation

class Note2 {
    var id: UUID = UUID()
    var title: String
    var content: String
    var last_edition: Date
    
    init(title: String = "new", content: String = "new", last_edition: Date = Date()) {
        self.title = title
        self.content = content
        self.last_edition = last_edition
    }
}



struct ContentView2: View {
    @State var newTodo: String = ""
    @State var newContentTodo: String = ""
    @State var selectID: UUID?
    @State var isChildClick: Bool = false
    
    var TextBar: some View {
        HStack {
            VStack(spacing: 20) {
                TextField("Enter new task: ", text: self.$newTodo)
                TextField("Enter new content: ", text: self.$newContentTodo)
            }
        }
    }
    
    @State var listNotes: [Note2] = [
        Note2(title: "Note 1", content: "This is Note 1 View", last_edition: Date()),
        Note2(title: "Note 2", content: "This is Note 2 View", last_edition: Date()),
        Note2(title: "Note 3", content: "This is Note 3 View", last_edition: Date())
    ]
    
    func addNote(index: Int, newNote: Note2) {
        //                listNotes.append(newNote)
        listNotes.append(Note2(title: newTodo, content: newContentTodo, last_edition: Date()))
        self.newTodo = ""
        self.newContentTodo = ""
    }
    
    func delete(at offsets: IndexSet) {
        listNotes.remove(atOffsets: offsets)
    }
    
    func editContent(id: UUID, newNote: Note2) {
        guard let index = listNotes.firstIndex (where: {$0.id == selectID}) else {return }
        listNotes[index] = newNote

    }
    func move(from source: IndexSet, to destination: Int) {
        listNotes.move(fromOffsets: source, toOffset: destination)
    }
    
    
    var body: some View {
        VStack {
            TextBar.padding()
            VStack {
                List {
                    ForEach(listNotes, id:\.id) { item in
                        VStack(spacing: 20) {
                            Text(item.title)
                            Text(item.content)
                            Text("UPDATED AT: \(item.last_edition)")
                        }.onTapGesture {
                            selectID = item.id
                            newTodo = item.title
                            newContentTodo = item.content
                            print(item.id)
                            isChildClick = true
                        }
                    }
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                    
                }
                .navigationBarItems(trailing: EditButton())
            }
            
            Button {
                addNote(index: 1, newNote: Note2())
            } label: {
                Text("Add".uppercased())
                    .navigationTitle("Tasks")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 300)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Button {
                let _newNote: Note2 = Note2(title: newTodo, content: newContentTodo, last_edition: Date())
                editContent(id: UUID(), newNote: _newNote)
            } label: {
                Text("Save".uppercased())
                    .navigationTitle("Tasks")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 300)
//                        .background(Color.blue)
                    .background(selectID == nil ? Color.gray : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(selectID == nil)
            
        }
        .onTapGesture {
            if isChildClick {
                isChildClick = false
            } else {
                selectID = nil
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
