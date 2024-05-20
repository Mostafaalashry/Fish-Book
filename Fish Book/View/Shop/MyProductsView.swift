//
//  MyProductsView.swift
//  Fish Book
//
//  Created by mostafa on 23/04/2024.
//

import SwiftUI

struct MyProductsView: View {
    @EnvironmentObject var vm :MyProductViewModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false  ){
            Spacer().frame(height: 30)
            ForEach(vm.myProducts , id: \.id) { product in
                
                
                MyProdectItem(product: product)
             
                
            }.frame(width: UIScreen.main.bounds.width)
            
        }
        .onAppear(
            perform: vm.fetchProducts
        )
        .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea(.all)
            .padding(.top ,30)
        
    }
    /*
     
     struct MyProductsView_Previews: PreviewProvider {
     static var previews: some View {
     MyProductsView()
     }
     }
     
     */
    
}
