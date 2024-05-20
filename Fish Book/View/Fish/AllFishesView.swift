//
//  AllFishesView.swift
//  Fish Book
//
//  Created by mostafa on 13/05/2024.
//

import SwiftUI

struct AllFishesView: View {
    @EnvironmentObject private var vm : FishViewModel
   //  var datafishes = dataa.allFishes
   
    var body: some View {
        NavigationView{
           
               // Color("lightGray")
            ScrollView(showsIndicators: false  ){
                
                ForEach(vm.allFishes ,  id: \.id) { fish in
                    NavigationLink {
                        FishDetaisView(fish: fish)
                    } label: {
                        FishItemView(fish: fish)
                        
                            .frame(width: UIScreen.main.bounds.width)
                    }
                    
                    
                }
                
                
                Spacer()
            }.frame(width: UIScreen.main.bounds.width)
                .navigationTitle("Fish Information")
                .background(Color("lightGray"))
        
            
            
        }
        .onAppear(
            perform: vm.fetchFishes
        )
        
    }
}
/*
 struct AllFishesView_Previews: PreviewProvider {
     static var previews: some View {
         AllFishesView()
     }
 }
 */

