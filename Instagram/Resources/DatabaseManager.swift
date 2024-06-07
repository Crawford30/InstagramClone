//
//  DatabaseManager.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/8/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager{
    
    //=====Creating a single instance
    static let shared = DatabaseManager()
    
    //====Databse ref
    let databaseRef = Database.database().reference()
    
    // MARK: - Public
    
    ///Check if username and email is avaliable
    //-Parameters
    //   -email string representing email
    //   -username string representing username
    
    // MARK: - Create New User
    public func canCreateNewUser(with email: String, username: String, password: String, completion: (Bool) -> Void){
        
        completion(true)
        
        
        
    }
    
    
    
    //Insert new user data to Dataase
    //-Parameters
    //   -email string representing email
    //   -username string representing username
    //   -completion : Async callback for result if database entry succeeded
    
    // MARK: - Insert New User To The DB
    public func insertNewUser(with email: String, username:String, completion: @escaping (Bool) -> Void) {
        
//        databaseRef.child(email).setValue(["username" : username], withCompletionBlock: { error,_  in
//        })
        
        //Making it with a Trailing clousre syntax
        databaseRef.child(email.safeDatabaseKey()).setValue(["email" : email, "username" : username]) { error,_  in
            
            if error == nil  {
                //succeeded
                completion(true)
                return
                
            }else {
                //Failed
                completion(false)
                return
                
            }
        }
        
        
        
    }
    
    
    //=====Function to create a safe email since firebase gives error with child key having "."
    // databaseRef.child(email).setValue(["username" : username])  in the email --> in the extensions
    
    //MARK: - Private
//    private func safeKey() {
//
//    }

}

