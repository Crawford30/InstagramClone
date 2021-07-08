//
//  LoginViewController.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/6/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//
//The approach of creating a view like this is called Anonymous closure
//private let usernameEmailField: UITextField = {
//    return UITextField()
//}()

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
        
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username Or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) //so that text is not flushed with the frame
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field =  UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) //so that text is not flushed with the frame
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    
    private let loginButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Login In", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal) //secondaryLabel is dark mode conformance color
        return button
        
    }()
    
    
    
    private let privacyButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal) //secondaryLabel is dark mode conformance color
        return button
        
    }()
    
    
    private let createAccountButton: UIButton = {
        let button =  UIButton()
        button.setTitleColor(.label, for: .normal) //label is the label for light and dark mode it adapts
        button.setTitle("New User? Create an account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header =  UIView()
        header.clipsToBounds = true //so that nothing overflows
        let bgImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(bgImageView)
        return header
    }()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        //Delegates for Textfields when the user taps enter button
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //======Frame For header view ====
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0
        ) //view.safeAreaInsets.top not to overlap with the notch
        
        
        //=====Frame for Username TextField
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width-50,
            height: 52.0
        )
        
        
        
        //=====Frame for Password TextField
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom+10,
            width: view.width-50,
            height: 52.0
        )
        
        
        
        //=====Frame for Login Button
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom+10,
            width: view.width-50,
            height: 52.0
        )
        
        
        
        //=====Frame for Create Account Button
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom+10,
            width: view.width-50,
            height: 52.0
        )
        
        //=====Frame for Terms Button
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 50.0
        )
        
        
        //=====Frame for Privacy Button
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width-20,
            height: 50.0
        )
        
        
        
        
        configureHeaderView()
        
    }
    
    
    
    //MARK:- Header View
    private func configureHeaderView(){
        
        //Should only have one subview by default
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first  else {
            return
        }
        
        //Assign the backgroundview frame to be the entirety of the header view
        backgroundView.frame = headerView.bounds
        
        //=====Add Instagram logo
        
        let logoImageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(logoImageView)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(
            x: headerView.width/4.0,
            y: view.safeAreaInsets.top,
            width: headerView.width/2.0,
            height: headerView.height-view.safeAreaInsets.top)
        
        
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
        
        //When Logged in btn is tapped,,dismiss the Keyboard
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        
        //check we have text
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
            let password = passwordField.text, !password.isEmpty, password.count >= 8
            else {
                return
        }
        
        //=======Login function===
        
    }
    
    @objc private func didTapTermsButton(){
        
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
        
    }
    
    @objc private func didTapPrivacyButton(){
        
        guard let url = URL(string: "https://www.elitedaily.com/p/what-is-instagrams-privacy-policy-heres-what-to-know-about-the-apps-rules-18689769") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
        
    }
    
    @objc private func didTapCreateAccountButton(){
        
        let vc = RegisterViewController()
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
}


extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == usernameEmailField) {
            passwordField.becomeFirstResponder() //the password field will be focused
            
        }
        else if(textField == passwordField){
            
            didTapTermsButton()
            
        }
        
        return true
    }
}
