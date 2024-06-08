//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by JOEL CRAWFORD on 7/6/21.
//  Copyright © 2021 JOEL CRAWFORD. All rights reserved.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeHolder: String
    var value: String?
}

final class EditProfileViewController: UIViewController {
    
    
    //Vertical feed
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        //Register the cell
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.indentifier)
        
       return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureModels()
        
        tableView.tableHeaderView = CreateTableHeaderView()
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }
                                                            
    
    
    //MARK: - Table View
    
    private func CreateTableHeaderView() -> UIView {
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral) //.integral->rounds up all the values
        
        //We wire a UIButton
        let size = tableHeaderView.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width - size)/2, y: (tableHeaderView.height - size)/2, width:size , height: size))
        
        tableHeaderView.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.tintColor = .label
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1.0
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        
        return tableHeaderView
        
    }
   
    


    //MARK: - ACTIONS
    
    private func configureModels() {
        
        //1st Section (name, username, website, bio)
        var sectionOne = [EditProfileFormModel]()
        let sectionOneLabels =  ["Name", "Username", "Bio"]
        
        for label in sectionOneLabels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)...", value: nil)
            sectionOne.append(model)
        }
    
        models.append(sectionOne)
        
        
        //2nd Section (email, phone, gender)
        var sectionTwo = [EditProfileFormModel]()
        let sectionTwoLabels =  ["E-mail", "Phone", "Gender"]
        
        for label in sectionTwoLabels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)...", value: nil)
            sectionTwo.append(model)
        }
        
        models.append(sectionTwo)
        
        
        
    }
    
    @objc private func didTapSave(){
        //Save Info to Database
        
        
        //dsimiss after saving
        self.dismiss(animated: true)
        
    }
    
    @objc private func  didTapProfilePhotoButton() {
        
    }
    
    @objc private func didTapCancel(){
        self.dismiss(animated: true)
    }
    
    @objc private func didTapChangeProfilePicture(){
        //Present Action sheet
        let actionSheet =  UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {_ in }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: {_ in }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //So that it doesnt crash in ipads
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
                                                            
   
}



//MARK:- TableView
extension EditProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.indentifier, for: indexPath) as! FormTableViewCell
//        cell.textLabel?.text = model.label
        cell.configureCell(with: model)
        
        //Call the delegate for textField
        cell.delegate = self
        return cell
    }
    
    
    //title for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        
        return "Private Information"
        
    }
    
   
    
    
}

extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCells(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel) {
       
        print((updatedModel.value ?? "nil"))
        //Update the Model
    }
    
    
}
