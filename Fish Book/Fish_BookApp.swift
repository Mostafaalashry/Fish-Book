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
    @StateObject var vmF = FavouriteProductsViewModel()
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(vm)
                .environmentObject(vmF)
        }
    }
}
