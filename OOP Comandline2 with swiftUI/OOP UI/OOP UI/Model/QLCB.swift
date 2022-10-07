//
//  QLCB.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import Foundation

class QLCB: ObservableObject {
    @Published var Management: [CanBo] = [
        CanBo(name: "Bill", age: "22", gender: "male", address: "Danang"),
        CongNhan(level: "10", name: "Ty", age: "30", gender: "Male", address: "SG"),
        KySu(faculty: "ETE", name: "Teo", age: "25", gender: "Female", address: "HN"),
        NhanVien(job: "Dev", name: "Fo", age: "29", gender: "Female", address: "HA")
    ]
    
    var newName: String = ""
    var newAge: String = ""
    var newGender: String = ""
    var newAddress: String = ""
    var newLevel: String = ""
    var newJob: String = ""
    var newFaculty: String = ""
    
    func addCN(newCN: CongNhan) {
        Management.append(newCN)
    }
    
    func addNV(newNV: NhanVien) {
        Management.append(newNV)
    }
    
    func addKS(index: Int, newKS: KySu) {
        Management.append(newKS)
    }
    
    func delete(at offsets: IndexSet) {
        Management.remove(atOffsets: offsets)
    }
    
    func edit(id: UUID, newName: String, newAge: String, newGender: String, newAddress: String, newLevel: String, newJob: String, newFaculty: String){
        if let index = Management.firstIndex(where: {$0.id == id}) {
            if Management[index] is CongNhan {
                Management[index] = CongNhan(level: newLevel, name: newName, age: newAge, gender: newGender, address: newAddress)
            }
            else if Management[index] is KySu {
                Management[index] = KySu(faculty: newFaculty, name: newName, age: newAge, gender: newGender, address: newAddress)
            }
            else if Management[index] is NhanVien {
                Management[index] = NhanVien(job: newJob, name: newName, age: newAge, gender: newGender, address: newAddress)
            }
            else if Management[index] is CanBo {
                Management[index] = CanBo(name: newName, age: newAge, gender: newGender, address: newAddress)
            }
        }
        
    }
}
