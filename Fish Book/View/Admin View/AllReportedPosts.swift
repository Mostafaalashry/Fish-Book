//
//  AllReportedPosts.swift
//  Fish Book
//
//  Created by mostafa on 14/06/2024.
//

import SwiftUI

struct AllReportedPosts: View {
    
    @EnvironmentObject var vm : ReportedPostsViewModel


    var body: some View {
       
            ScrollView{
               
       
                ForEach((vm.allReportedPosts.reversed()) , id: \.id) { post in
                               
                       ReportedPostViewItem(post: post)
                       
                        .frame(maxWidth:  UIScreen.main.bounds.width)
                    }
                   
                Spacer()
                    .frame(height: 20)
                }
          
            .background(Color("lightGray"))
        .onAppear{
            
            vm . fetchReportedPosts()
            
        }
          
       
        
       
        
    }
}

struct AllReportedPosts_Previews: PreviewProvider {
    static var previews: some View {
        AllReportedPosts()
    }
}
