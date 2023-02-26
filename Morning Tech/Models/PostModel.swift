//
//  PostModel.swift
//  Morning Tech
//
//  Created by Krish Vijayan on 2023-02-25.
//

import Foundation

struct PostModel: Identifiable {
    let id: String
    let postDate: String
    let postTitle: String
    let postAuthor: String
    let postPoints: Int
}
