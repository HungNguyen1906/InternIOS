//
//  NV.swift
//  OOP Comandline2
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class NhanVien: CanBo {
    var job: String
    init(job: String, name: String, age: Int, gender: String, address: String) {
        self.job = job
        super.init(name: name, age: age, gender: gender, address: address)
    }
    
    override func showInfo() {
        super.showInfo()
        print(self.job)
    }
    
    static func createNV() -> NhanVien{
        var newJob: String?
        var newName: String?
        var newAge: Int?
        var newGender: String?
        var newAddress: String?
        
        repeat {
            print("Input new job: ")
            newJob = String(readLine()!)
        } while (newJob == nil)
        
        repeat {
            print("Input name: ")
            newName = String(readLine()!)
        } while (newName == nil)
        
        repeat {
            print("Input age: ")
            newAge = Int(readLine()!)
        } while (newAge == nil)
        
        repeat {
            print("Input gender: ")
            newGender = String(readLine()!)
        } while (newGender == nil)
        
        repeat {
            print("Input address: ")
            newAddress = String(readLine()!)
        } while (newAddress == nil)
        
        return NhanVien(job: newJob!, name: newName!, age: newAge!, gender: newGender!, address: newAddress!)
    }
}
