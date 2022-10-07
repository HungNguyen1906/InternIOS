//
//  MainView.swift
//  OOP UI
//
//  Created by MaxMobile on 06/10/2022.
//

import SwiftUI

struct MainView: View {
    @State var showSheet: Bool = false
    @StateObject var QLCanBo = QLCB()
    var body: some View {
        NavigationView{
            List {
                ForEach(QLCanBo.Management, id:\.id) { canbo in
                    NavigationLink(
                        destination: EditView(canBoQL: QLCanBo, CB: canbo),
                        label: {
                            VStack {
                                Text("Name: \(canbo.name)")
                                Text("Age: \(canbo.age)")
                                Text("Gender: \(canbo.gender)")
                                Text("Address: \(canbo.address)")
                            }
                        }
                    )
                }
                .onDelete(perform: QLCanBo.delete(at:))
            }
            .navigationTitle("Manager")
            .navigationBarItems(
                leading: EditButton(),
                trailing: HStack{
                    addButton
                })
        }
    }
    
    var addCNButton: some View {
        Button {
            QLCanBo.addCN( newCN: CongNhan(level: QLCanBo.newLevel, name: QLCanBo.newName, age: QLCanBo.newAge, gender: QLCanBo.newGender, address: QLCanBo.newAddress))
        } label: {
            Text("New CN")
        }
    }
    
    var addNVButton: some View {
        Button {
            QLCanBo.addNV(newNV: NhanVien(job: QLCanBo.newJob, name: QLCanBo.newName, age: QLCanBo.newAge, gender: QLCanBo.newGender, address: QLCanBo.newAddress))
        } label: {
            Text("New NV")
        }
    }
    
    var addKSButton: some View {
        Button {
            let num = Int.random(in: 0...5)
            QLCanBo.addKS(index: num, newKS: KySu(faculty: QLCanBo.newFaculty, name: QLCanBo.newName, age: QLCanBo.newAge, gender: QLCanBo.newGender, address: QLCanBo.newAddress))
        } label: {
            Text("New KS")
        }
    }
    
    var addButton: some View {
        Button (action: {
            showSheet.toggle()
        }, label: {
            Text("Add")
        })
        .sheet(isPresented: $showSheet, content: {
            VStack{
                Text("Hello! Choose some body you wanna add.")
                    .padding()
                addCNButton
                    .padding()
                addNVButton
                    .padding()
                addKSButton
                    .padding()
            }
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
