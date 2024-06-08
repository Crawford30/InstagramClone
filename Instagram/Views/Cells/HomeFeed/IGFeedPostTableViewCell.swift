//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by Joel Crawford on 6/8/24.
//  Copyright © 2024 JOEL CRAWFORD. All rights reserved.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let indentifier = "IGFeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
