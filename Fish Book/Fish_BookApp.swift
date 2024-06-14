//
//  Fish_BookApp.swift
//  Fish Book
//
//  Created by mostafa on 06/02/2024.
//

import SwiftUI

@main
struct Fish_BookApp: App {
    
    
    @StateObject var vm = AllProductViewModel()
    @StateObject var vmfish = FishViewModel()
    @StateObject var vmF = FavouriteProductsViewModel()
    @StateObject var vmM = MyProductViewModel()
    @StateObject var vmPosts = AllPostsViewModel()
    @StateObject var vmMyPosts = MyPostsViewModel()
   
    @StateObject var vmComments = AllCommentsViewModel()
    @StateObject var userProfile = UserProfileViewModel()
    @StateObject var friendProfile = FriendProfileViewModel()
    @StateObject var friendPosts = FriendPostsViewModel()
    @StateObject var friendPrroduct = FriendPrroductViewModel()
    @StateObject var ReportedPosts  = ReportedPostsViewModel()
    @StateObject var ReportedProduct  = ReportedProductViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(vm)
                .environmentObject(vmF)
                .environmentObject(vmM)
                .environmentObject(vmfish)
                .environmentObject(vmPosts)
                .environmentObject(vmMyPosts)
                .environmentObject(vmComments)
                .environmentObject(userProfile)
                .environmentObject(friendProfile)
                .environmentObject(friendPosts)
                .environmentObject(friendPrroduct)
                .environmentObject(ReportedPosts)
                .environmentObject(ReportedProduct)

            
        }
    }
}
