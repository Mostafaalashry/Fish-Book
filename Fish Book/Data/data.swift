//
//  data.swift
//  Fish Book
//
//  Created by mostafa on 09/04/2024.
//

import Foundation

struct dataa{
    static let allFishes : [FishModel] = [
        FishModel(id: 1, name: "snnsnmsm", imageUrl: "firstScreen", fishDetails: [
            FishDeetails(header: "title 1", content: "StringStringStringStringStringStringStringString")
               , FishDeetails(header: "title 2", content: "StringStringStringStringStringStringStringString")
               ,FishDeetails(header: "title 3", content: "StringStringStringStringStringStringStringString")
                ,FishDeetails(header: "title 4", content: "StringStringStringStringStringStringStringString")
                  ,FishDeetails(header: "title 5", content: "StringStringStringStringStringStringStringString")
                                                                                 ])
        ,
        FishModel(id: 2, name: "snnsnmsm", imageUrl: "firstScreen", fishDetails: [
            FishDeetails(header: "title 1", content: "StringStringStringStringStringStringStringString")
               , FishDeetails(header: "title 2", content: "StringStringStringStringStringStringStringString")
               ,FishDeetails(header: "title 3", content: "StringStringStringStringStringStringStringString")
                ,FishDeetails(header: "title 4", content: "StringStringStringStringStringStringStringString")
                  ,FishDeetails(header: "title 5", content: "StringStringStringStringStringStringStringString")
                                                                                 ])
        ,
        FishModel(id: 3, name: "snnsnmsm", imageUrl: "firstScreen", fishDetails: [
            FishDeetails(header: "title 1", content: "StringStringStringStringStringStringStringString")
               , FishDeetails(header: "title 2", content: "StringStringStringStringStringStringStringString")
               ,FishDeetails(header: "title 3", content: "StringStringStringStringStringStringStringString")
                ,FishDeetails(header: "title 4", content: "StringStringStringStringStringStringStringString")
                  ,FishDeetails(header: "title 5", content: "StringStringStringStringStringStringStringString")
                                                                                 ])
        ,
        FishModel(id: 4, name: "snnsnmsm", imageUrl: "firstScreen", fishDetails: [
            FishDeetails(header: "title 1", content: "StringStringStringStringStringStringStringString")
               , FishDeetails(header: "title 2", content: "StringStringStringStringStringStringStringString")
               ,FishDeetails(header: "title 3", content: "StringStringStringStringStringStringStringString")
                ,FishDeetails(header: "title 4", content: "StringStringStringStringStringStringStringString")
                  ,FishDeetails(header: "title 5", content: "StringStringStringStringStringStringStringString")
                                                                                 ])
        ,
        FishModel(id: 5, name: "snnsnmsm", imageUrl: "firstScreen", fishDetails: [
            FishDeetails(header: "title 1", content: "StringStringStringStringStringStringStringString")
               , FishDeetails(header: "title 2", content: "StringStringStringStringStringStringStringString")
               ,FishDeetails(header: "title 3", content: "StringStringStringStringStringStringStringString")
                ,FishDeetails(header: "title 4", content: "StringStringStringStringStringStringStringString")
                  ,FishDeetails(header: "title 5", content: "StringStringStringStringStringStringStringString")
                                                                                 ])
        ,
        FishModel(id: 6, name: "snnsnmsm", imageUrl: "firstScreen", fishDetails: [
            FishDeetails(header: "title 1", content: "StringStringStringStringStringStringStringString")
               , FishDeetails(header: "title 2", content: "StringStringStringStringStringStringStringString")
               ,FishDeetails(header: "title 3", content: "StringStringStringStringStringStringStringString")
                ,FishDeetails(header: "title 4", content: "StringStringStringStringStringStringStringString")
                  ,FishDeetails(header: "title 5", content: "StringStringStringStringStringStringStringString")
                                                                                 ])
    ]
    static let allProducts: [ProductModel] =  [
         ProductModel(id: 1,
                         title: "Fishing Rod",
                         content: "High-quality fishing rod made from carbon fiber. Suitable for both freshwater and saltwater fishing. Length: 7 feet.",
                         price: 99,
                      imageUrl: "1",
                      liked: false,
                      categoryId: 1,
                      publisherName: "Fishing Master Co.",
                      publisherImage: "",
                      publisherId: 4,
                      createdOn: "2024-05-09",
                      updatedOn: "2024-05-09"),
            
            ProductModel(id: 2,
                         title: "Fishing Reel",
                         content: "Durable fishing reel with a smooth drag system. Gear ratio: 6.2:1. Ideal for casting and retrieving lures.",
                         price: 79,
                         imageUrl: "11",
                         liked: false,
                         categoryId: 1,
                         publisherName: "ReelTech",
                         publisherImage: "",
                         publisherId: 5,
                         createdOn: "2024-04-09",
                         updatedOn: "2024-04-09"),
            
            ProductModel(id: 3,
                         title: "Fishing Lure Set",
                         content: "Complete set of fishing lures for catching various fish species. Includes spinners, crankbaits, and soft plastic baits.",
                         price: 49,
                         imageUrl: "111",
                         liked: false,
                         categoryId: 1,
                         publisherName: "LureMasters",
                         publisherImage: "",
                         publisherId: 6,
                         createdOn: "2024-04-09",
                         updatedOn: "2024-04-09"),
            
            // Add more products as needed...
            
            ProductModel(id: 4,
                         title: "Baitcasting Reel",
                         content: "Precision-engineered baitcasting reel with a high gear ratio. Smooth casting and retrieval for accurate lure presentation.",
                         price: 129,
                         imageUrl: "1111",
                         liked: false,
                         categoryId: 1,
                         publisherName: "BaitCaster Pro",
                         publisherImage: "",
                         publisherId: 7,
                         createdOn: "2024-04-09",
                         updatedOn: "2024-04-09"),
              ProductModel(id: 5,
                         title: "Fishing Rod",
                         content: "High-quality fishing rod made from carbon fiber. Suitable for both freshwater and saltwater fishing. Length: 7 feet.",
                         price: 99,
                           imageUrl: "2",
                           liked: false,
                           categoryId: 2,
                           publisherName: "Fishing Master Co.",
                           publisherImage: "",
                           publisherId: 8,
                           createdOn: "2024-04-09",
                           updatedOn: "2024-04-09"),
            
            ProductModel(id: 6,
                         title: "Fishing Reel",
                         content: "Durable fishing reel with a smooth drag system. Gear ratio: 6.2:1. Ideal for casting and retrieving lures.",
                         price: 79,
                         imageUrl: "22",
                         liked: false,
                         categoryId: 2,
                         publisherName: "ReelTech",
                         publisherImage: "",
                         publisherId: 9,
                         createdOn: "2024-04-09",
                         updatedOn: "2024-04-09"),
            
            ProductModel(id: 7,
                         title: "Fishing Lure Set",
                         content: "Complete set of fishing lures for catching various fish species. Includes spinners, crankbaits, and soft plastic baits.",
                         price: 49,
                         imageUrl: "222",
                         liked: false,
                         categoryId: 2,
                         publisherName: "LureMasters",
                         publisherImage: "",
                         publisherId: 7,
                         createdOn: "2024-04-09",
                         updatedOn: "2024-04-09"),
            
            // Add more products as needed...
            
            ProductModel(id: 8,
                         title: "Baitcasting Reel",
                         content: "Precision-engineered baitcasting reel with a high gear ratio. Smooth casting and retrieval for accurate lure presentation.",
                         price: 129,
                         imageUrl: "2222",
                         liked: false,
                         categoryId: 2,
                         publisherName: "BaitCaster Pro",
                         publisherImage: "",
                         publisherId: 88,
                         createdOn: "2024-04-09",
                         updatedOn: "2024-04-09"),
    ]
    
    
}
