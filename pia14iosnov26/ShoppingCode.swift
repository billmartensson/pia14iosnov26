//
//  ShoppingCode.swift
//  pia14iosnov26
//
//  Created by BillU on 2025-11-26.
//

import Foundation
import SwiftUI

struct Shopitem : Identifiable {
    let id = UUID()
    let name : String
    let amount : Int
    var isDone = false
}

@Observable class ShoppingCode {
        
    var shopping : [Shopitem] = []
    
    var isError = false
    
    func loadshopping() {
        
        let s1 = Shopitem(name: "Apelsin", amount: 10)
        let s2 = Shopitem(name: "Banan", amount: 12)
        
        shopping.append(s1)
        shopping.append(s2)
    }
    
    func addShop(addname : String, addamount : String) {
        
        guard let amountnumber = Int(addamount) else {
            isError = true
            return
        }
        
        guard addname != "" else {
            isError = true
            return
        }
                
        let s1 = Shopitem(name: addname, amount: amountnumber)

        shopping.append(s1)

        isError = false
    }
    
    func deleteShop(deletething : Shopitem) {
        shopping.removeAll(where: { $0.id == deletething.id })
    }
    
    func changeDone(changething : Shopitem) {
        if let shopindex = shopping.firstIndex(where: { $0.id == changething.id }) {
            
            shopping[shopindex].isDone.toggle()
        }
    }
    
}
