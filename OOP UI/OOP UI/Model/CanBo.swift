//
//  CanBo.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class CanBo{
    var name: String
    var age: String
    var gender: String
    var address: String
    var id: UUID = UUID()
    
    init(name: String, age: String, gender: String, address: String) {
        self.name = name
        self.age = age
        self.gender = gender
        self.address = address
    }
}
