//
//  AuthManager.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/8/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import FirebaseAuth


public class AuthManager{
    
    //=====Creating a single instance
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username:String, email:String, password: String) {
        
    }
    
    public func loginUser(username: String?, email: String?, password: String){
        
        //optional username and password, because a user may provide either username or email

    }
    

}
