//
//  CB.swift
//  OOP Comandline2
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class CanBo {
    var name: String
    var age: Int
    var gender: String
    var address: String
    
    init(name: String, age: Int, gender: String, address: String) {
        self.name = name
        self.age = age
        self.gender = gender
        self.address = address
    }
    
    func showInfo() {
        print(self.name)
        print(self.age)
        print(self.gender)
    }
    
    static func createCB() -> CanBo{
        var newName: String?
        var newAge: Int?
        var newGender: String?
        var newAddress: String?
        
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
        
        
        return CanBo(name: newName!, age: newAge!, gender: newGender!, address: newAddress!)
    }
}
