//
//  FriendProfileView.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.


import SwiftUI
import SDWebImageSwiftUI


struct FriendProfileView: View {
    @State private var selection = 1
    @EnvironmentObject var vm: FriendProfileViewModel
    
    @State var followed : Bool = false
    let id :Int
  // @State  var isFollowed:Bool = false
  
    init( id:Int) {
       
        self.id = id
      // @State var followed  = vm.frriendProfile.followed
       // self._followed = State(initialValue: vm.frriendProfile.followed)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    if vm.frriendProfile.imageUrl == "" || vm.frriendProfile.imageUrl == nil{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .center)
                            .cornerRadius(60)
                            .foregroundColor(Color("lightgray 1"))
                            .clipped()
                           // .padding()
                    } else {
                        WebImage(url: URL(string: vm.frriendProfile.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(60)
                            .clipped()
                          //  .padding()
                            .clipShape(Circle())
                    }
                   
                    HStack{
                       // Spacer()
                        VStack {
                            Text(vm.frriendProfile.firstname!)
                                .font(Font.system(size: 14, weight: .medium))
                        }
                        //.padding()
                     
                        
                        VStack {
                            Text(vm.frriendProfile.lastname ?? "")
                                .font(Font.system(size: 14, weight: .medium))
                        }
                      //  .padding(.trailing)
                        
                        
                      //  Spacer()
                       // Spacer()
                        
                       // Spacer()
                    }
                    
                    
                    
                    //
                }
                .frame(alignment: .leading)
                
               
                
                Spacer()
                VStack{
                    HStack{
                        VStack {
                            Text(String(vm.frriendProfile.numberOfFollowers))
                                .font(Font.system(size: 16, weight: .bold))
                            
                            Text("Followers")
                                .font(Font.system(size: 12, weight: .semibold))
                        }
                        //.padding(.horizontal)
                     
                        
                        VStack {
                            Text(String(vm.frriendProfile.numberOfFollowing))
                                .font(Font.system(size: 16, weight: .bold))
                        
                            
                            Text("Following")
                                .font(Font.system(size: 12, weight: .semibold))
                           }
                      //  .padding(.horizontal)
                    }
                    
                    Button {
                        let urlString  = vm.frriendProfile.followed ? "http://localhost:8080/api/users/unfollow/\(id)" : "http://localhost:8080/api/users/follow/\(id)"
                        
                        let token  = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
                        if vm.frriendProfile.followed {
                            WebServices().sendID(httpMethod:"DELETE",urlString: urlString, token: token) { (result: Result<Int, Error>) in
                                switch result {
                                case .success(let success):
                                    vm.frriendProfile.followed.toggle()
                                    print (success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                        }else{
                            WebServices().sendID(httpMethod:"POST",urlString: urlString, token: token) { (result: Result<Int, Error>) in
                                switch result {
                                case .success(let success):
                                    vm.frriendProfile.followed.toggle()
                                    print (success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                        }
                       
                        
                       
                    } label: {
                        
                        Text(vm.frriendProfile.followed ?  "Unfollow" : "Follow" )
                            .foregroundColor(Color("Primary Blue"))
                            .font(.system(size: 16,weight: .bold,design: .serif))
                            .padding(.top)
                            .padding(.leading , 70)
                            .padding(.trailing)
                        
                        
                    }
                    
                    ///
                }
               
      
              
            }
            
            
            /////////
           

            
            
            
            HStack {
                if vm.frriendProfile.bio != nil {
                    Text((vm.frriendProfile.bio!))
                        .font(.caption)
                        .padding(.trailing)
                        .padding(.vertical)
                } else {
                    Text("No bio available")
                        .font(.caption)
                        .padding(.horizontal)
                }
                Spacer()
               
            }
            
            Picker(selection: $selection, label: Text("")) {
                Text("My products").tag(0)
                
                Text("My posts").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selection == 0 {
                
                FrriendAllPrroducts(id: Int(vm.frriendProfile.id))
                   // .edgesIgnoringSafeArea(.all)
                   // .ignoresSafeArea(.all)
            } else if selection == 1 {
                
                FriendPostsView(id: Int(vm.frriendProfile.id))
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            vm.fetchUserProfile(id: id)
           
        }
    }
}


/*
 struct FriendProfileView_Previews: PreviewProvider {
     static var previews: some View {
         FriendProfileView()
     }
 }

 
 */
