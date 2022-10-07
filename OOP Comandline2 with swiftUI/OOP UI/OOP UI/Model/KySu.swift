//
//  KySu.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class KySu: CanBo {
    @Published var faculty: String
    init(faculty: String, name: String, age: String, gender: String, address: String) {
        self.faculty = faculty
        super.init(name: name, age: age, gender: gender, address: address)
    }
}
