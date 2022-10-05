//
//  main.swift
//  OOP commandline
//
//  Created by MaxMobile on 22/09/2022.
//

import Foundation

class Documents {
    var id: Int?
    var nxb: String?
    var NoBan: Int?
    init(id: Int?, nxb: String?, NoBan: Int?) {
        self.id = id
        self.nxb = nxb
        self.NoBan = NoBan
    }
}

class Book: Documents {
    var author: String?
    var PageNum: Int?
    init(author: String?, PageNum: Int?) {
        self.author = author
        self.PageNum = PageNum
        super .init(id: 0, nxb: "Kim Dong", NoBan: 1000)
    }
    init(author: String?, PageNum: Int?, id: Int?, nxb: String?, NoBan: Int?) {
        self.author = author
        self.PageNum = PageNum
        super.init(id: id, nxb: nxb, NoBan: NoBan)
    }
}

class Magazine: Documents {
    var NoPH: Int?
    var Month: Date
    init (NoPH: Int?, Month: Date = Date()) {
        self.NoPH = NoPH
        self.Month = Month
        super.init(id: 1, nxb: "Ha Noi", NoBan: 2000)
    }
    init(NoPH: Int?, Month: Date = Date() ,id: Int?, nxb: String?, NoBan: Int?) {
        self.NoPH = NoPH
        self.Month = Month
        super .init(id: id, nxb: nxb, NoBan: NoBan)
    }
}

class Newspaper: Documents {
    var Day: Date
    init(Day: Date = Date()) {
        self.Day = Day
        super.init(id: 2, nxb: "HCM", NoBan: 3000)
    }
    init(Day: Date = Date(), id: Int?, nxb: String?, NoBan: Int?) {
        self.Day = Day
        super .init(id: id, nxb: nxb, NoBan: NoBan)
    }
}

func createBook() -> Book{
    var booksID: Int?
    var booksNXB: String?
    var booksNoBan: Int?
    var booksAuthor: String?
    var booksPageNum: Int?
    
    repeat {
        print("Input ID: ")
        booksID = Int(readLine()!)
    } while (booksID == nil)
    
    repeat {
        print("Input publishing company: ")
        booksNXB = String(readLine()!)
    } while(booksNXB == nil)
    
    repeat {
        print("Input number of books: ")
        booksNoBan = Int(readLine()!)
    } while(booksNoBan == nil)
    
    repeat {
        print("Input author: ")
        booksAuthor = String(readLine()!)
    } while(booksAuthor == nil)
    
    repeat {
        print("Input pages number: ")
        booksPageNum = Int(readLine()!)
    } while(booksPageNum == nil)
    
    return Book(author: booksAuthor, PageNum: booksPageNum, id: booksID, nxb: booksNXB, NoBan: booksNoBan)
}

func createMagazine() -> Magazine {
    var magaIDNew: Int?
    var magaNXBNew: String?
    var magaNoBanNew: Int?
    var magaNoPHNew: Int?
    repeat{
        print("Update new magazine ID: ")
        magaIDNew = Int(readLine()!)
    } while(magaIDNew == nil)
    
    repeat{
        print("Update new magazine publishing company: ")
        magaNXBNew = String(readLine()!)
    } while(magaNXBNew == nil)
    
    repeat{
        print("Update new magazine amount: ")
        magaNoBanNew = Int(readLine()!)
    } while(magaNoBanNew == nil)
    
    repeat{
        print("Update new magazine publishing number: ")
        magaNoPHNew = Int(readLine()!)
    } while(magaNoPHNew == nil)
    return Magazine(NoPH: magaNoPHNew, id: magaIDNew, nxb: magaNXBNew, NoBan: magaNoBanNew)
}

func createNewspaper() -> Newspaper{
    var newsppIDNew: Int?
    var newsppNXBNew: String?
    var newsppNoBanNew: Int?
    
    repeat{
        print("Update new newspaper ID: ")
        newsppIDNew = Int(readLine()!)
    }while (newsppIDNew == nil)
    
    repeat{
        print("Update new newspaper publishing company: ")
        newsppNXBNew = String(readLine()!)
    }while (newsppNXBNew == nil)
    
    repeat{
        print("Update new newspaper amount: ")
        newsppNoBanNew = Int(readLine()!)
    }while (newsppNoBanNew == nil)
    return Newspaper(id: newsppIDNew, nxb: newsppNXBNew, NoBan: newsppNoBanNew)
}

var docManager: DocManager = DocManager()
var option: Int?

repeat {
    print("Choose the options: ")
    print("Option 1: Book")
    print("Option 2: Magazine")
    print("Option 3: Newspaper")
    print("Option 4: Remove Doc with ID")
    print("Option 5: Search")
    print("Option 6: Edit")
    option = Int(readLine()!)
    
    switch option {
    case 1:
        
        docManager.docArr.append(createBook())
        break
        
    case 2:
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
        
        docManager.docArr.append(createMagazine())
        break
        
    case 3:
        //        let newspaper = Newspaper(Day: Date())
        //        print("Input ID: ")
        //        newspaper.id = Int(readLine()!)
        //        print("Input publishing company: ")
        //        newspaper.nxb = String(readLine()!)
        //        print("Input number of magazines: ")
        //        newspaper.NoBan = Int(readLine()!)
        //        docManager.docArr.append(newspaper)
        
        docManager.docArr.append(createNewspaper())
        break
        
    case 4:
        var inputID: Int?
        print("Input ID you want to remove")
        inputID = Int(readLine()!)
        let docRM = docManager.docArr
            .filter{inputID != $0.id}
        docManager.docArr = docRM
        print(docManager.docArr)
        
        //        docManager.docArr.removeAll(where:{inputID == $0.id})
        //        print(docManager.docArr)
        break
        
    case 5:
        var inputName: String?
        print("Enter keyword you want to search: ")
        inputName = String(readLine()!)
        var resolve = [Documents]()
        
        for doc in docManager.docArr {
            if (inputName == doc.nxb){
                resolve.append(doc)
            }
        }
        print(resolve)
        break
        
    case 6:
        print("Input ID you want to edit: ")
        var inputID: Int?
        inputID = Int(readLine()!)
        
        if let index: Int = docManager.docArr.firstIndex(where: {inputID == $0.id}) {
            
            if docManager.docArr[index] is Book {
                //                    var booksIDNew: Int?
                //                    var booksNXBNew: String?
                //                    var booksNoBanNew: Int?
                //                    var booksAuthorNew: String?
                //                    var booksPageNumNew: Int?
                //
                //                    repeat{
                //                        print("Update new book ID: ")
                //                        booksIDNew = Int(readLine()!)
                //                    } while(booksIDNew == nil)
                //
                //                    repeat{
                //                        print("Update new book publishing company: ")
                //                        booksNXBNew = String(readLine()!)
                //                    } while(booksNXBNew == nil)
                //
                //                    repeat{
                //                        print("Update new books amount: ")
                //                        booksNoBanNew = Int(readLine()!)
                //                    } while(booksNoBanNew == nil)
                //
                //                    repeat{
                //                        print("Update new book author: ")
                //                        booksAuthorNew = String(readLine()!)
                //                    } while(booksAuthorNew == nil)
                //
                //                    repeat{
                //                        print("Update new book pages amount: ")
                //                        booksPageNumNew = Int(readLine()!)
                //                    } while(booksPageNumNew == nil)
                
                //                    docManager.docArr[index] = Book(author: booksAuthorNew, PageNum: booksPageNumNew, id: booksIDNew, nxb: booksNXBNew, NoBan: booksNoBanNew)
                
                docManager.docArr[index] = createBook()
            }
            else if docManager.docArr[index] is Magazine{
                //                var magaIDNew: Int?
                //                var magaNXBNew: String?
                //                var magaNoBanNew: Int?
                //                var magaNoPHNew: Int?
                //                repeat{
                //                    print("Update new magazine ID: ")
                //                    magaIDNew = Int(readLine()!)
                //                } while(magaIDNew == nil)
                //
                //                repeat{
                //                    print("Update new magazine publishing company: ")
                //                    magaNXBNew = String(readLine()!)
                //                } while(magaNXBNew == nil)
                //
                //                repeat{
                //                    print("Update new magazine amount: ")
                //                    magaNoBanNew = Int(readLine()!)
                //                } while(magaNoBanNew == nil)
                //
                //                repeat{
                //                    print("Update new magazine publishing number: ")
                //                    magaNoPHNew = Int(readLine()!)
                //                } while(magaNoPHNew == nil)
                //                docManager.docArr[index] = Magazine(NoPH: magaNoPHNew, id: magaIDNew, nxb: magaNXBNew, NoBan: magaNoBanNew)
                
                docManager.docArr[index] = createNewspaper()
                
            }
            else if docManager.docArr[index] is Newspaper{
                //                var newsppIDNew: Int?
                //                var newsppNXBNew: String?
                //                var newsppNoBanNew: Int?
                //
                //                repeat{
                //                    print("Update new newspaper ID: ")
                //                    newsppIDNew = Int(readLine()!)
                //                }while (newsppIDNew == nil)
                //
                //                repeat{
                //                    print("Update new newspaper publishing company: ")
                //                    newsppNXBNew = String(readLine()!)
                //                }while (newsppNXBNew == nil)
                //
                //                repeat{
                //                    print("Update new newspaper amount: ")
                //                    newsppNoBanNew = Int(readLine()!)
                //                }while (newsppNoBanNew == nil)
                //
                //                docManager.docArr[index] = Newspaper(id: newsppIDNew, nxb: newsppNXBNew, NoBan: newsppNoBanNew)
                
                docManager.docArr[index] = createNewspaper()
                
            }
            else{
                print("Not found!")
            }
        }
        break
        
    default:
        print("Exit program")
        print(docManager.docArr)
        break
    }
} while (option != 7 && option != nil)

class DocManager {
    var docArr: [Documents] = [
        Documents(id: 11, nxb: "Kim Dong", NoBan: 1000),
        
        Book(author: "hghghg nbmftry", PageNum: 122, id: 88, nxb: "Nam cao", NoBan: 123),
        Book(author: "rtdgf jufgnhu", PageNum: 122, id: 88, nxb: "Cao Van", NoBan: 321),
        Magazine(NoPH: 909, id: 44, nxb: "ALO", NoBan: 555),
        Newspaper(id: 99, nxb: "AAA", NoBan: 999)
    ]
}
