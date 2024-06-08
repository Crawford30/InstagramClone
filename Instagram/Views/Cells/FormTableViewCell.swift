//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by Joel Crawford on 6/8/24.
//  Copyright © 2024 JOEL CRAWFORD. All rights reserved.
//

import UIKit

//Retruning the value to the VC (we use protocol)
//We use AnyObject so that we can put a property
protocol FormTableViewCellDelegate: AnyObject {
    
    //updatedModel
//    func formTableViewCells(_ cell: FormTableViewCell, didUpdateField value: String?)
    
    func formTableViewCells(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel)
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    public weak var delegate: FormTableViewCellDelegate?
    private var model: EditProfileFormModel?
    
    static let indentifier = "FormTableViewCell"
    
    private let formLabel: UILabel =  {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let textField: UITextField =  {
        let textField = UITextField()
        textField.returnKeyType = .done
        return textField
        
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        
        contentView.addSubview(formLabel)
        contentView.addSubview(textField)
        textField.delegate = self
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    public func configureCell(with model: EditProfileFormModel) {
        self.model = model //pass the value
        formLabel.text = model.label
        textField.placeholder = model.placeHolder
        textField.text = model.value
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        textField.placeholder = nil
        textField.text = nil
        
    }
    
    
    
    
    //MARK: - Layout Subviewa
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Assign Frams
        formLabel.frame = CGRect(
            x: 5,
            y: 0,
            width: contentView.width/3,
            height: contentView.height)
        
        
        textField.frame = CGRect(
            x: formLabel.right + 5,
            y: 0,
            width: contentView.width - 10 - formLabel.width,
            height: contentView.height)
    }
    
    
    
    //MARK: - TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Get Updated value before
        model?.value = textField.text
        
        
        guard let model = model else {
            return true
        }
        
        
        //Each time a user hits the return key, we call
//        delegate?.formTableViewCells(self, didUpdateField: textField.text)
        
        
        delegate?.formTableViewCells(self, didUpdateField: model)
        
        textField.resignFirstResponder() //gets rid of the keyboard when the user hit return
        return true
    }

}
