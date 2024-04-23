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
            ForEach(vm.myProducts , id: \.id) { product in
                
                
                MyProdectItem(product: product)
                //  .padding(.vertical,20)
                //   .frame(width: UIScreen.main.bounds.width)
                
                
                
                
            }.frame(width: UIScreen.main.bounds.width)
            
        }
        .onAppear(
            perform: vm.fetchProducts
        )
        
    }
    /*
     
     struct MyProductsView_Previews: PreviewProvider {
     static var previews: some View {
     MyProductsView()
     }
     }
     
     */
    
}
