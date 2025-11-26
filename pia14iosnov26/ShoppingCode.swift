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
    
    func loadshopping() {
        
        var s1 = Shopitem(name: "Apelsin", amount: 10)
        var s2 = Shopitem(name: "Banan", amount: 12)
        
        shopping.append(s1)
        shopping.append(s2)
    }
}
