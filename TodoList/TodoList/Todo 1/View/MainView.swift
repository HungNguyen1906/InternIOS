//
//  MainView.swift
//  TodoList
//
//  Created by MaxMobile on 31/08/2022.
//

import SwiftUI

class ListNote: ObservableObject {
    @Published var notes: [Note] = [
        Note(title: "Note 1", content: "This is Note 1 View", last_edition: Date()),
        Note(title: "Note 2", content: "This is Note 2 View", last_edition: Date()),
        Note(title: "Note 3", content: "This is Note 3 View", last_edition: Date())
    ]
    
    @State var newToDo: String = ""
    @State var newContentTodo: String = ""
    func addNotes(index: Int, newNote: Note) {
        notes.append(newNote)
    }
    
    func addNewNote(_ objectNote: Note) {
        notes.insert(objectNote, at: 0)
        print(notes)
    }
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    func editNote(newC: String, newT: String, id: UUID) {
        guard let index = notes.firstIndex(where: {$0.id == id}) else {return}
        //firstIndex co the duoc xem nhu 1 vong lap
        notes[index] = Note(title: newT, content: newC, last_edition: Date())
        //gan notes[index] gia tri cua 1 Note moi
        //notes se duoc cap nhat lai khi 1 phan tu cua no bi thay doi dia chi
    }
}

struct MainView: View {
    @StateObject var object = ListNote()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(object.notes, id:\.id) { note in
                        NavigationLink(
                            destination: EditView(listNote: object, toDoNote: note),
                            label: {
                                
                                VStack {
                                    Text(note.content)
                                    Text(note.title)
                                    Text("Update: \(note.last_edition)")
                                }
                            }
                        )
                    }
                    .onDelete (perform: self.delete)
                }
                .navigationTitle("Hello!")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: HStack {
                        addButton
                    })
            }
        }.onAppear(perform: {
            print("onAppear onAppear onAppear")
            
        })
    }
    
    var addButton: some View {
        Button {
            let num: Int = Int.random(in: 0...5)
            object.addNotes(index: num, newNote: Note(title: object.newToDo, content: object.newContentTodo, last_edition: Date()) )
        } label: {
            Text("Add")
        }
    }
    
    func delete(at offsets: IndexSet) {
        object.notes.remove(atOffsets: offsets)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
