//
//  Post.swift
//  Morning Tech
//
//  Created by Krish Vijayan on 2023-02-25.
//

import Foundation

struct PostData: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String { return objectID }
    let objectID: String
    let created_at: String
    let title: String
    let url: String? //Sometimes URL is null
    let author: String
    let points: Int
}
