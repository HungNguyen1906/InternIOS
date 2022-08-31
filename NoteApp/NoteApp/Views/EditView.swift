//
//  EditNote.swift
//  NoteApp
//
//  Created by MaxMobile on 29/08/2022.
//

import SwiftUI

struct EditView: View {
    @State var contentEdit: String = "Edit content here!"
    @State var contentSaved: String = ""
    @ObservedObject var listNote: ListNote
    var index: Int
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $contentEdit)
                    .frame(height: 250)
                    .colorMultiply(Color.white)
                    .cornerRadius(10)
                
                Button(action: {
                    contentSaved = contentEdit
                    listNote.editContent(index: index, newContent: contentEdit)
                }, label: {
                    Text("Change".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Text(contentSaved)
                
                Spacer()
            }
            .padding()
        }.navigationTitle("Edit space: ")
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(listNote: ListNote(), index: 1)
    }
}
