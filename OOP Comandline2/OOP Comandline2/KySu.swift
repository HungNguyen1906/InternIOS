//
//  KS.swift
//  OOP Comandline2
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class KySu: CanBo {
    var faculty: String
    init(faculty: String, name: String, age: Int, gender: String, address: String) {
        self.faculty = faculty
        super.init(name: name, age: age, gender: gender, address: address)
    }
    
    override func showInfo() {
        super.showInfo()
        print(self.faculty)
    }
    
    static func createKS() -> KySu{
        var newFaculty: String?
        var newName: String?
        var newAge: Int?
        var newGender: String?
        var newAddress: String?
        
        repeat {
            print("Input new faculty: ")
            newFaculty = String(readLine()!)
        } while (newFaculty == nil)
        
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
        
        return KySu(faculty: newFaculty!, name: newName!, age: newAge!, gender: newGender!, address: newAddress!)
    }
}
