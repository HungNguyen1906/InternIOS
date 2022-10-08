//
//  NhanVien.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class NhanVien: CanBo {
    @Published var job: String
    init(job: String, name: String, age: String, gender: String, address: String) {
        self.job = job
        super.init(name: name, age: age, gender: gender, address: address)
    }
}
