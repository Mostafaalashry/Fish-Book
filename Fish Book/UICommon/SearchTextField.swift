//
//  SearchTextField.swift
//  Fish Book
//
//  Created by mostafa on 18/03/2024.
//

import SwiftUI

struct SearchTextField: View {
    @State var placholder:String = "placeholder"
    @State var txt:String = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 20 , height: 20)
              //  .foregroundColor(Color("Primary Blue"))
            
            TextField(placholder, text: $txt)
                .textInputAutocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0 ,maxWidth: .infinity)
               // .font(.custom(<#T##name: String##String#>, size: <#T##CGFloat#>, relativeTo: .))
            
        }
       
        .padding(15)
       
        .background(Color("SecondaryBlue"))
        .cornerRadius(20)
        .padding(.horizontal  )
        
        
    }
}

struct SearchTextField_Previews: PreviewProvider {
    @State static var txt :String = ""
    static var previews: some View {
        SearchTextField(placholder: "Search store", txt: txt)
    }
}
