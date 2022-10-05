////
////  main.swift
////  OOP commandline
////
////  Created by MaxMobile on 22/09/2022.
////
//
//import Foundation
//
//class Documents {
//    var id: Int?
//    var nxb: String?
//    var NoBan: Int?
//    init(id: Int?, nxb: String?, NoBan: Int?) {
//        self.id = id
//        self.nxb = nxb
//        self.NoBan = NoBan
//    }
//}
//
//class Book: Documents {
//    var author: String?
//    var PageNum: Int?
//    init(author: String?, PageNum: Int?) {
//        self.author = author
//        self.PageNum = PageNum
//        super .init(id: 0, nxb: "Kim Dong", NoBan: 1000)
//    }
//}
//
//class Magazine: Documents {
//    var NoPH: Int?
//    var Month: Date
//    init (NoPH: Int?, Month: Date = Date()) {
//        self.NoPH = NoPH
//        self.Month = Month
//        super.init(id: 1, nxb: "Ha Noi", NoBan: 2000)
//    }
//}
//
//class Newspaper: Documents {
//    var Day: Date
//    init(Day: Date = Date()) {
//        self.Day = Day
//        super.init(id: 2, nxb: "HCM", NoBan: 3000)
//    }
//}
//
//var docManager: DocManager = DocManager()
//
//var option: Int?
//var inputID: Int?
//
//
//repeat {
//    print("Choose the options: ")
//    print("Option 1: Book")
//    print("Option 2: Magazine")
//    print("Option 3: Newspaper")
//    print("Option 4: Remove Doc with ID")
//    option = Int(readLine()!)
//
//    switch option {
//    case 1:
////        let books = Book(author: "", PageNum: 600)
////        print("Input ID: ")
////        books.id = Int(readLine()!)
////        print("Input publishing company: ")
////        books.nxb = String(readLine()!)
////        print("Input number of books: ")
////        books.NoBan = Int(readLine()!)
////        print("Input author: ")
////        books.author = String(readLine()!)
////        print("Input pages number: ")
////        books.PageNum = Int(readLine()!)
////        docManager.docArr.append(books)
//
//
//        var booksID: Int?
//        var booksNXB: String?
//        var booksNoBan: Int?
//        var booksAuthor: String?
//        var booksPageNum: Int?
//
//        print("Input ID: ")
//        booksID = Int(readLine()!)
//        print("Input publishing company: ")
//        booksNXB = String(readLine()!)
//        print("Input number of books: ")
//        booksNoBan = Int(readLine()!)
//        print("Input author: ")
//        booksAuthor = String(readLine()!)
//        print("Input pages number: ")
//        booksPageNum = Int(readLine()!)
//
////        if(type(of: booksID) == type(of: Book(author: "", PageNum: 0).id) && type(of: booksNXB) == type(of: Book(author: "", PageNum: 0).nxb) && type(of: booksNoBan) == type(of: Book(author: "", PageNum: 0).NoBan) && type(of: booksAuthor) == type(of: Book(author: "", PageNum: 0).author) && type(of: booksPageNum) == type(of: Book(author: "", PageNum: 0).PageNum))
////        {
////            booksID = Book(author: "", PageNum: 0).id
////            booksNXB = Book(author: "", PageNum: 0).nxb
////            booksNoBan = Book(author: "", PageNum: 0).NoBan
////            booksAuthor = Book(author: "", PageNum: 0).author
////            booksPageNum = Book(author: "", PageNum: 0).PageNum
////        } else {
////            print("Input again!")
////        }
////        docManager.docArr.append(Book(author: booksAuthor, PageNum: booksPageNum))
//
//
//        break
//
//    case 2:
//        let magazines = Magazine(NoPH: 500, Month: Date())
//        print("Input ID: ")
//        magazines.id = Int(readLine()!)
//        print("Input publishing company: ")
//        magazines.nxb = String(readLine()!)
//        print("Input number of magazines: ")
//        magazines.NoBan = Int(readLine()!)
//        print("Input number of magazines released: ")
//        magazines.NoPH = Int(readLine()!)
//        docManager.docArr.append(magazines)
//        break
//
//    case 3:
//        let newspaper = Newspaper(Day: Date())
//        print("Input ID: ")
//        newspaper.id = Int(readLine()!)
//        print("Input publishing company: ")
//        newspaper.nxb = String(readLine()!)
//        print("Input number of magazines: ")
//        newspaper.NoBan = Int(readLine()!)
//        docManager.docArr.append(newspaper)
//        break
//
//    default:
//        print("Exit program")
//        print(docManager.docArr)
//        break
//    }
//} while (option != 4 && option != nil)
//
//class DocManager {
//    var docArr: [Documents] = [
//        Documents(id: 0, nxb: "Kim Dong", NoBan: 1000)
//    ]
//
//}
//
////print(docManager.docArr)
//
//
