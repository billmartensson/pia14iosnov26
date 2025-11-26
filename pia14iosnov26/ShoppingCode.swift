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
    var name : String
    var amount : Int
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
    
    func addShop(addname : String, addamount : String, shopthing : Shopitem?) -> Bool {
        
        guard let amountnumber = Int(addamount) else {
            isError = true
            return false
        }
        
        guard addname != "" else {
            isError = true
            return false
        }
                
        if shopthing == nil {
            // ADD
            let s1 = Shopitem(name: addname, amount: amountnumber)
            shopping.append(s1)
        } else {
            // EDIT
            if let shopindex = shopping.firstIndex(where: { $0.id == shopthing!.id }) {
                
                shopping[shopindex].name = addname
                shopping[shopindex].amount = amountnumber
            }
        }
        
        isError = false
        
        return true
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
