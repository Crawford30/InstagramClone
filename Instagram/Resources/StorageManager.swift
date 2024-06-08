//
//  StorageManager.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/8/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import FirebaseStorage

public class StorageManager{
    
    //=====Creating a single instance
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    // MARK: - Public
    //Three functions: Upload Photopost,
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL,Error>) -> Void){
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping  (Result<URL, IGStorageManagerError>) -> Void) {
        
        bucket.child(reference).downloadURL(completion: { url, error in
        
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            //If successful to get the url, we call the completion
            completion(.success(url))
            
        })
        
    }
    

}


enum UserPostType {
   case photo, video
}

public struct UserPost {
    let postType: UserPostType
    
}
