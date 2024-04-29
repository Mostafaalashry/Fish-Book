//
//  ProfileView.swift
//  Fish Book
//
//  Created by mostafa on 15/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var selection = 0
    
    var body: some View {
            VStack {
                HStack {
                    Image("firstScreen")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        .cornerRadius(60)
                        .clipped()
                        .padding()
                    Spacer()
                    
                    VStack {
                        Text("205")
                            .font(Font.system(size: 16, weight: .bold))
                        Text("Posts")
                            .font(Font.system(size: 14, weight: .medium))
                    }
                    Spacer()

                    VStack {
                        Text("364")
                            .font(Font.system(size: 16, weight: .bold))
                        Text("Followers")
                            .font(Font.system(size: 14, weight: .medium))
                    }
                    Spacer()

                    VStack {
                        Text("358")
                            .font(Font.system(size: 16, weight: .bold))
                        Text("Following")
                            .font(Font.system(size: 14, weight: .medium))
                    }
                    Spacer()
                }
                HStack {
                    Text("I breathe life in objects #Programmer \nStraight Edge \nAiming to make this planet #gogreen \nLoves Football \nFan of @fcbarcelona @liverpoolfc \npankajgaikar.com")
                        .font(.caption)
                        .padding(.horizontal)
                    Spacer()
                    NavigationLink {
                        UpdateUserInfoView()
                    } label: {
                        Image(systemName: "pencil.line")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20 ,height: 20)
                            .padding(.trailing)
                    }

                   
                }
                
                Picker(selection: $selection, label: Text("")) {
                    Text("MyProducts").tag(0)
                    Text("View 2").tag(1)
                    Text("View 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
                
                if selection == 0 {
                    
                    MyProductsView()
                    
                } else if selection == 1 {
                    View2()
                } else {
                    View3()
                }
                
                Spacer()
            }
            .padding()
        }
    }



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

/*
 struct View1: View {
     private let columns = [
         GridItem(.flexible()),
         GridItem(.flexible()),
     ]
     @EnvironmentObject var vm : AllProductViewModel

     var body: some View {
         ScrollView {
             LazyVGrid(columns: columns) {
                 ForEach(vm.products , id: \.id) { productt in
                         
                         NavigationLink {
                             ProductDetailsView(product: productt, isfavourite: productt.isLiked)
                         } label: {
                             ProductCell(productt: productt)
                                 .padding()
                         }
                     
                 }
             }
         }
     }
 }
 */


struct View2: View {
    var body: some View {
        Text("View 22")
    }
}

struct View3: View {
    var body: some View {
        Text("View 33")
    }
}
