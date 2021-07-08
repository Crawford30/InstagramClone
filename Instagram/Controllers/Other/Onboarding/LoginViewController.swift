//
//  LoginViewController.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/6/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field =  UITextField()
        field.isSecureTextEntry = true
        return field
       }()
    
    
    private let loginButton: UIButton = {
           return UIButton()
          }()
    
    private let termsButton: UIButton = {
                 return UIButton()
                }()
       
       
      
    private let privacyButton: UIButton = {
                    return UIButton()
                   }()
    
    
    private let createAccountButton: UIButton = {
                          return UIButton()
                         }()
    
    private let headerView: UIView = {
     return UIView()
    }()
    
    
   
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //=====Assign Frames
    }
    
    
    //MARK:- Add SubViews
    private func addSubviews(){
         view.addSubview(usernameEmailField)
         view.addSubview(passwordField)
         view.addSubview(loginButton)
         view.addSubview(termsButton)
         view.addSubview(privacyButton)
         view.addSubview(createAccountButton)
         view.addSubview(headerView)
         
    }
    
    //MARK:- Button Functions
    @objc private func didTapLogginButton(){
        
    }
    
    @objc private func didTapTermsButton(){
        
    }
    
    @objc private func didTapPrivacyButton(){
        
    }
    
    @objc private func didTapCreateAccountButton(){
        
    }
    
    

   

}
