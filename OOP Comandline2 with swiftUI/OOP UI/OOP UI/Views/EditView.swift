//
//  EditView.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import SwiftUI

struct EditView: View {
    @State var nameEdit: String = ""
    @State var ageEdit: String = ""
    @State var genderEdit: String = ""
    @State var addressEdit: String = ""
    @State var levelEdit: String = ""
    @State var jobEdit: String = ""
    @State var facultyEdit: String = ""
    
    @State var nameSaved: String = ""
    @State var ageSaved: String = ""
    @State var genderSaved: String = ""
    @State var addressSaved: String = ""
    @State var levelSaved: String = ""
    @State var jobSaved: String = ""
    @State var facultySaved: String = ""
    
    @ObservedObject var canBoQL: QLCB
    var CB: CanBo
    enum TypeOfCanBo {
        case congNhan, kySu, nhanVien, canBo
    }
    @State var typeOfCanBo: TypeOfCanBo!
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Edit name: ", text: $nameEdit)
                    TextField("Edit age: ", text: $ageEdit)
                    TextField("Edit gender: ", text: $genderEdit)
                    TextField("Edit address: ", text: $addressEdit)
                    
                    switch self.typeOfCanBo {
                    case .kySu:
                        TextField("Edit faculty: ", text: $facultyEdit)
                        
                    case .nhanVien:
                        TextField("Edit job: ", text: $jobEdit)
                        
                    case .congNhan:
                        TextField("Edit level: ", text: $levelEdit)
                        
                    default:
                        Spacer()
                    }
                }
                Button(action: {
                    nameSaved = nameEdit
                    ageSaved = ageEdit
                    genderSaved = genderEdit
                    addressSaved = addressEdit
                    levelSaved = levelEdit
                    jobSaved = jobEdit
                    facultySaved = facultyEdit
                    
                    let _: CongNhan = CongNhan(level: levelSaved, name: nameSaved, age: ageSaved, gender: genderSaved, address: addressSaved)
                    
                    let _: NhanVien = NhanVien(job: jobSaved, name: nameSaved, age: ageSaved, gender: genderSaved, address: addressSaved)
                    
                    let _: KySu = KySu(faculty: facultySaved, name: nameSaved, age: ageSaved, gender: genderSaved, address: addressSaved)
                    
                    let _: CanBo = CanBo(name: nameSaved, age: ageSaved, gender: genderSaved, address: addressSaved)
                    
                    canBoQL.edit(id: CB.id, newName: nameSaved, newAge: ageSaved, newGender: genderSaved, newAddress: addressSaved, newLevel: levelSaved, newJob: jobSaved, newFaculty: facultySaved)
                }, label: {
                    Text("saved".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
        // hiển thị info ở phần edit
        .onAppear(perform: {
            CBinfo()
            
            nameEdit = CB.name
            ageEdit = CB.age
            genderEdit = CB.gender
            addressEdit = CB.address
            
            
            if let _: CongNhan = CB as? CongNhan {
                print("_____ CongNhan")
            }
            if let _: NhanVien = CB as? NhanVien {
                print("_____ NhanVien")
            }
            if let _: KySu = CB as? KySu {
                print("_____ KySu")
            }
        })
    }
    
    func CBinfo() {
        switch CB {
        case is CongNhan:
            self.typeOfCanBo = .congNhan
        case is NhanVien:
            self.typeOfCanBo = .nhanVien
        case is KySu:
            self.typeOfCanBo = .kySu
        default:
            self.typeOfCanBo = .canBo
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        //        EditView()
        Text("")
    }
}
