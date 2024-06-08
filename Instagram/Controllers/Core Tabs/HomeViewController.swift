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
    
    //Vertical feed
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        //Register the cell
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.indentifier)
        
       return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //======The first controller that lauches is this
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
        
//        do {
//            try Auth.auth().signOut()
//        }
//        catch{
//            print("Failed to signout")
//        }
        
        
       
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.indentifier, for: indexPath) as! IGFeedPostTableViewCell
        return cell
        
    }
    
    
    public func configureCell() {
        //Configure the cell
        
        
    }
    
    
    
}
