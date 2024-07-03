//
//  Models.swift
//  Instagram
//
//  Created by Joel Crawford on 7/3/24.
//  Copyright © 2024 JOEL CRAWFORD. All rights reserved.
//

import Foundation
enum Gender {
case male, female, other
}

struct User{
    let username: String
    let bio: String
    let name: (firstName: String, lastName: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinedDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}



public enum UserPostType {
   case photo, video
}

////Represents a user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImageURL: URL
    let postURL: URL //either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let tagUsers: [String]
    
}




struct PostLike {
//    let identifier: String
    let userName: String
    let postIdentifier: String
}


struct CommentLike {
//    let identifier: String
    let userName: String
    let commentIdentifier: String
}



struct PostComment {
    let identifier: String
    let userName: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}

