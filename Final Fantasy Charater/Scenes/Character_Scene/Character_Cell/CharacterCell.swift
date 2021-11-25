//
//  CharacterCell.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 25/01/21.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var avatarName: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    lazy var avatarID: UILabel = {
        let label = UILabel()
        
        return label
    }()
   
    override var reuseIdentifier: String? {
            "CharacterCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImage)
        contentView.addSubview(avatarName)
        contentView.addSubview(avatarID)
    }
}




