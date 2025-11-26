//
//  ContentView.swift
//  pia14iosnov26
//
//  Created by BillU on 2025-11-26.
//

import SwiftUI

struct ContentView: View {
    
    @State var shopcode = ShoppingCode()
    
    @State var addname = ""
    @State var addamount = ""
    
    var body: some View {
        VStack {
            
            HStack {

                TextField("Name", text: $addname)
                    .background(Color.red)

                TextField("Amount", text: $addamount)
                    .background(Color.green)
                    .frame(width: 50)

                Button("ADD") {
                    shopcode.addShop(addname: addname, addamount: addamount)
                }
            }
            
            if shopcode.isError {
                VStack {
                    Text("FEL FEL ERROR ERROR")
                }
                .padding()
                .background(Color.red)
            }
            
            List(shopcode.shopping) { shopthing in
                
                Button(action: {
                    
                }) {
                    HStack {
                        Text(shopthing.name)
                        Spacer()
                        Text("\(shopthing.amount)")
                        
                        Button(action: {
                            shopcode.changeDone(changething: shopthing)
                        }) {
                            if shopthing.isDone {
                                Text("✅")
                            } else {
                                Text("☑️")
                            }
                        }
                        
                        Button(action: {
                            shopcode.deleteShop(deletething: shopthing)
                        }) {
                            Text("🗑️")
                        }
                    }
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
