//
//  CongNhan.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class CongNhan : CanBo {
    @Published var level: String
    init(level: String,name: String, age: String, gender: String, address: String) {
        self.level = level
        super.init(name: name, age: age, gender: gender, address: address)
    }
}
