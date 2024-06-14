//
//  AllReportedProductsView.swift
//  Fish Book
//
//  Created by mostafa on 15/06/2024.
//

import SwiftUI

struct AllReportedProductsView: View {
    @EnvironmentObject var vm : ReportedProductViewModel


    var body: some View {
       
            ScrollView{
               
       
                ForEach((vm.allReportedProduct.reversed()) , id: \.id) { product in
                               
                       ReportedProductItemView(product: product)
                       
                        .frame(maxWidth:  UIScreen.main.bounds.width)
                    }
                   
                Spacer()
                    .frame(height: 20)
                }
          
            .background(Color("lightGray"))
        .onAppear{
            
            vm.fetchReportedProduct()
            
        }
          
       
        
       
        
    }
}

struct AllReportedProductsView_Previews: PreviewProvider {
    static var previews: some View {
        AllReportedProductsView()
    }
}
