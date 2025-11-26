//
//  ContentView.swift
//  pia14iosnov26
//
//  Created by BillU on 2025-11-26.
//

import SwiftUI

struct ContentView: View {
    
    @State var shopcode = ShoppingCode()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            List(shopcode.shopping) { shopthing in
                HStack {
                    Text(shopthing.name)
                    Spacer()
                    Text("\(shopthing.amount)")
                }
            }
            
        }
        .padding()
        .onAppear() {
            shopcode.loadshopping()
        }
    }
}

#Preview {
    ContentView()
}
