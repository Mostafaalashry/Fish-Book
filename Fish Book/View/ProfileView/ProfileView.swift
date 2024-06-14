//
//  ProfileView.swift
//  Fish Book
//
//  Created by mostafa on 15/04/2024.
//
import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    @State private var selection = 0
    @EnvironmentObject var vm: UserProfileViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack{
                    if vm.userProfile.imageUrl == "" || vm.userProfile.imageUrl == nil{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .center)
                            .cornerRadius(60)
                            .foregroundColor(Color("lightgray 1"))
                            .clipped()
                            .padding()
                    } else {
                        WebImage(url: URL(string: vm.userProfile.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .center)
                            .cornerRadius(60)
                            .clipped()
                            .padding()
                            .clipShape(Circle())
                    }
                    
                    HStack{
                        
                        VStack {
                            Text(vm.userProfile.firstname!)
                                .font(Font.system(size: 14, weight: .medium))
                        }
                        //.padding()
                     
                        
                        VStack {
                            Text(vm.userProfile.lastname ?? "")
                                .font(Font.system(size: 14, weight: .medium))
                        }
                      //  .padding(.trailing)
                        
                    }
                    
                    
                    
                    //
                }
               
                
                Spacer()
                
                VStack {
                    Text(String(vm.userProfile.numberOfFollowers))
                        .font(Font.system(size: 16, weight: .bold))
                    
                    Text("Followers")
                        .font(Font.system(size: 14, weight: .semibold))
                }
                .padding(.horizontal)
             
                
                VStack {
                    Text(String(vm.userProfile.numberOfFollowing))
                        .font(Font.system(size: 16, weight: .bold))
                
                    
                    Text("Following")
                        .font(Font.system(size: 14, weight: .semibold))
                   }
                .padding(.horizontal)
                
                
                
              
              
            }
            
            HStack {
                if vm.userProfile.bio != nil {
                    Text((vm.userProfile.bio!))
                        .font(.caption)
                        .padding(.horizontal)
                } else {
                    Text("No bio available")
                        .font(.caption)
                        .padding(.horizontal)
                }
                Spacer()
                NavigationLink {
                    UpdateUserInfoView()
                } label: {
                    Image(systemName: "pencil.line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                }
                //
                
                
                
                
                if vm.userProfile.id  == 1 {
                   // print("i am an admin")
                    NavigationLink {
                        
                      AdminProfileView()
                        
                    } label: {
                       // Image(systemName: "person.badge.key")
                        Text("Admin profile")
                           
                            //.frame(width: 20, height: 20)
                            .padding(.horizontal)
                            .foregroundColor(Color.blue)
                    }

                    
                }
               
             
                
                
                
                
                //
            }
            
            Picker(selection: $selection, label: Text("")) {
                Text("My products").tag(0)
                Text("My posts").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selection == 0 {
                MyProductsView()
                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea(.all)
            } else if selection == 1 {
                MyPostsView()
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            vm.fetchUserProfile()
            print("this is an id \(vm.userProfile.id)"  )
        }
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




