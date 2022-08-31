//
//  AddView.swift
//  NoteApp
//
//  Created by MaxMobile on 29/08/2022.
//

import SwiftUI

struct AddView: View {
    
    @State var textEdit: String = "Add here!"
    @State var savedText: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var listNote: ListNote
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEdit)
                    .frame(height: 250)
                    .colorMultiply(Color.gray)
                    .cornerRadius(10)
                    
                Button(action: {
                    savedText = textEdit
                    listNote.addNotes(newNote: textEdit)
                    self.mode.wrappedValue.dismiss()
//                    savedText = textEdit
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Text(savedText)
                
                Spacer()
                
            }
            .padding()
            
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(listNote: ListNote())
    }
}
