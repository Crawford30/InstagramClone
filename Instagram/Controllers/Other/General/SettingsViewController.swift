//
//  SettingsViewController.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/6/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

//MARK: - ViewController to Show user setting. Made final so that no one can sub-class it
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
        
    }()
    
    private var data =  [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
       

       
    }
    
    //Gets called after all the other subviews have laidout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
        
    }
    
    
    //MARK: - CONFIGURE MODEL
    private func configureModels() {
        let section = [
//            SettingCellModel(title: "Log Out", handler: <#T##(() -> Void)##(() -> Void)##() -> Void#>) since its a last param, we can use trailer closure
            
            SettingCellModel(title: "Log Out") { [weak self] in   //weak self , so that it doesnt cause memory leak because we're referencing self
                self?.didTapLogout()
                
            }
        ]
        data.append(section)
        
    }
    

    
    //MARK: - Logout User Out
    private func didTapLogout() {
        
        let actionSheet = UIAlertController(title: "Log Out", message: "Would you like to logout?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
            
            AuthManager.shared.logoutUser(completion: {success in
                
                DispatchQueue.main.async {
                    if success {
                        //Present login screen
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true, completion: {
                            //Get out of the settings and switch to main tab
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                            
                        })
                        
                    }else {
                        //Something went wrong
                        fatalError("Could not logout user")
                    }
                }
               
            })
        }))
        
        //So that it doesnt crash on ipaps, we do these two things
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
    }
   

}


extension SettingsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Handle Cell Selection Here
        //We get the model out
        let model =  data[indexPath.section][indexPath.row]
        model.handler()
    }
    
    
    
    
}
