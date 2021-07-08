//
//  ViewController.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/6/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //======The first controller that lauches is this
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
        
        
       
    }
    
    private func handleNotAuthenticated(){
        //=====Check Auth Status by checking firebase session=======
               if(Auth.auth().currentUser == nil){
                   //======Show Login Controller====
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                present(loginVC, animated: false, completion: nil)
                
               }
        
    }


}

