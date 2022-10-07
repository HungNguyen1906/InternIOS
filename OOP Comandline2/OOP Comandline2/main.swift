//
//  main.swift
//  OOP Comandline2
//
//  Created by MaxMobile on 05/10/2022.
//

import Foundation

func main() {
    let manager: QLCB = QLCB()
    var option: Int?

    repeat {
        print("Option 1: Add new CN")
        print("Option 2: Add new KS")
        print("Option 3: Add new NV")
        print("Option 4: Search")
        print("Option 5: Edit")
        option = Int(readLine()!)
        
        switch option {
        case 1:
            let CNInfo: CongNhan = CongNhan.createCN()
            manager.Management.append(CNInfo)
        case 2:
            manager.Management.append(KySu.createKS())
        case 3:
            manager.Management.append(NhanVien.createNV())
        case 4:
            print("Input someone's name you want to search: ")
            var searchName: String?
            searchName = String(readLine()!)
            var people = [CanBo]()
            for peopleSearch in manager.Management{
                if (searchName == peopleSearch.name) {
                    people.append(peopleSearch)
                }
                else {
                    print("There is no one you wanna find!")
                }
            }
            print(people)
        case 5:
            print("Input name you want to edit: ")
            var nameInput: String?
            nameInput = String(readLine()!)
            if let index: Int = manager.Management.firstIndex(where: {nameInput == $0.name}) {
                if manager.Management[index] is CongNhan {
                    manager.Management[index] = CongNhan.createCN()
                }
                else if (manager.Management[index] is KySu) {
                    manager.Management[index] = KySu.createKS()
                }
                else if manager.Management[index] is NhanVien{
                    manager.Management[index] = NhanVien.createNV()
                }
            }
        default:
            print(manager.Management)
        }
    } while(option != 6 && option != nil)
}

main()
