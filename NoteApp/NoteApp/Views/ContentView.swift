//
//  ContentView.swift
//  NoteApp
//
//  Created by MaxMobile on 29/08/2022.
//

import SwiftUI

class ListNote: ObservableObject {
    @Published var notes: [String] = ["Note 1", "Note 2", "Note 3", "Note 4", "Note 5"]
    func addNotes(newNote: String) {
        notes.append(newNote)
    }
    
    func delete(indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
    
    func editContent(index: Int, newContent: String) {
        notes[index] = newContent
    }
    
}

struct ContentView: View {
    
    //    @State var Note: [String] = ["Note 1", "Note 2", "Note 3", "Note 4", "Note 5"]
    @StateObject var object = ListNote()
    
    func addNotes() {
        let newNote: String = "Note \(object.notes.count + 1)"
        object.notes.append(newNote)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    Section (
                        header: Text("Scroll")) {
                            ForEach(object.notes, id: \.self) { theNote in
                                let index: Int = object.notes.firstIndex(of: theNote)!
                                
                                NavigationLink(
                                    destination: EditView(listNote: object, index: index),
                                    label: {
                                        Text(theNote.capitalized)
                                    }
                                )
                            }
                            .onDelete(perform: self.delete)
                        }
                    
                }
                
                .navigationTitle("Welcome!")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: addButton
                )
                
                
            }
            
            
            
        }
        .padding(.bottom/*@END_MENU_TOKEN@*/)
        
    }
    
//    var addButton: some View {
//        NavigationLink(destination: AddView(listNote: object), label: {
//            Text("Add")
//        })
//    }
    
    
    
        var addButton: some View {
            Button {
                let num: Int = Int.random(in: 0...4)
                object.editContent(index: num, newContent: "Changed \(num)")
            } label: {
                Text("ABC")
            }
    
        }
    
    func delete(indexSet: IndexSet) {
        object.notes.remove(atOffsets: indexSet)
    }
    
    
    //    func add() {
    //        object.notes.append("Note \(count)")
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
