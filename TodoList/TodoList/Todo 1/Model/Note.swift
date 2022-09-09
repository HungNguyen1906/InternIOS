//
//  Note.swift
//  TodoList
//
//  Created by MaxMobile on 05/09/2022.
//

import Foundation

class Note: ObservableObject{
    @Published var id: UUID = UUID()
    @Published var title: String
    @Published var content: String
    @Published var last_edition: Date
    
    init(title: String = "Title", content: String = "Content", last_edition: Date = Date()) {
        self.title = title
        self.content = content
        self.last_edition = last_edition
    }
}


