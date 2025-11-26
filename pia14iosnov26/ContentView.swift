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
    
    @State var selectedshop : Shopitem?
    
    @State var showlisttype = "all"
    
    func addshop() {
        let addresult = shopcode.addShop(addname: addname, addamount: addamount, shopthing: selectedshop)
        
        if addresult == true {
            // GICK BRA
            selectedshop = nil
            addname = ""
            addamount = ""
        } else {
            // GICK DÅLIGT
        }
    }
    
    func getsortedlist() -> [Shopitem] {
        /*
        return shopcode.shopping.sorted(by: { $0.name < $1.name })
         */
        
        if showlisttype == "all" {
            return shopcode.shopping
        }
        if showlisttype == "notdone" {
            return shopcode.shopping.filter({$0.isDone == false})
        }
        if showlisttype == "done" {
            return shopcode.shopping.filter({$0.isDone == true})
        }

        return shopcode.shopping
    }
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Name", text: $addname)
                    .background(Color.cyan)

                TextField("Amount", text: $addamount)
                    .background(Color.cyan)
                    .frame(width: 50)

                Button(selectedshop == nil ? "ADD" : "SAVE") {
                    addshop()
                }
            }
            
            Button("Clear") {
                selectedshop = nil
                addname = ""
                addamount = ""
            }
            
            if shopcode.isError {
                VStack {
                    Text("FEL FEL ERROR ERROR")
                }
                .padding()
                .background(Color.red)
            }
            
            HStack {
                
                Button("ALL") {
                    showlisttype = "all"
                }
                .padding()
                .background(showlisttype == "all" ? Color.yellow : Color.clear)
                
                Button("TO BUY") {
                    showlisttype = "notdone"
                }
                .padding()
                .background(showlisttype == "notdone" ? Color.yellow : Color.clear)

                Button("BOUGHT") {
                    showlisttype = "done"
                }
                .padding()
                .background(showlisttype == "done" ? Color.yellow : Color.clear)

            }
            
            
            List(getsortedlist()) { shopthing in
                
                Button(action: {
                    selectedshop = shopthing
                    addname = shopthing.name
                    addamount = "\(shopthing.amount)"
                }) {
                    HStack {
                        
                        if selectedshop?.id == shopthing.id {
                            Text("✏️")
                        }
                        
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
