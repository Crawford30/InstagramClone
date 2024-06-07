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
    
    
    //MARK: - REGISTER USER
    public func registerNewUser(username:String, email:String, password: String,completion: @escaping (Bool) -> Void) {
        /*
         - check if  username is avaliable
         - check if email is avalible
         - create account
         - Insert account to database
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username, password: password ){ canCreate in
            
            if canCreate {
                /*
                 - create account
                 - Insert accoun to databse
                 */
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    
                    guard error == nil, result != nil else {
                        //Completion will also be false if we are unable to create an account
                        //FirebaseAuth could not create an account
                        
                        completion(false)
                        return
                    }
                    
                    
                    //Insert Into Database
                   // DatabaseManager.shared.insertNewUser(with: email, username: username, completion: T##(Bool) -> Void)
                    
                    DatabaseManager.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted {
                            completion(true)
                            return
                            
                        } else {
                            
                            //Failed to insert to database
                            completion(false)
                            return
                            
                        }
                        
                    }
                            
                }
            } else{
                
                //Either username or Emial doesnot exist
                 completion(false)
                
            }
        }
        
    
    }
    
    
    
    //MARK: - LOGIN USER
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) ->
        Void) {
        
        //NB: It's escaping becuase we used a completion inside another closure, as a result the scope needs to escaped
        
        //optional username and password, because a user may provide either username or email
        if let email = email{
            //Email login
            Auth.auth().signIn(withEmail: email, password: password) { (authResults, error) in
                guard authResults != nil, error == nil else {
                    //means user has been signed in successfully
                    completion(false)
                    return
                }
                completion(true)
            }
            
        }
        
        if let username = username {
            //username login
            print(username)
            
        }
        
    }
    
    
}
