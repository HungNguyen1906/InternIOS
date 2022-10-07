//
//  CN.swift
//  OOP Comandline2
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class CongNhan : CanBo {
    var level: Int
    init(level: Int,name: String, age: Int, gender: String, address: String) {
        self.level = level
        super.init(name: name, age: age, gender: gender, address: address)
    }
    
    override func showInfo() {
        super.showInfo()
        print(self.level)
    }
    
    static func createCN() -> CongNhan{
        var newLevel: Int?
        var newName: String?
        var newAge: Int?
        var newGender: String?
        var newAddress: String?
        
        repeat{
            print("Input new level: ")
            newLevel = Int(readLine()!)
        } while(newLevel == nil)
        
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
        
        return CongNhan(level: newLevel!, name: newName!, age: newAge!, gender: newGender!, address: newAddress!)
    }

}
