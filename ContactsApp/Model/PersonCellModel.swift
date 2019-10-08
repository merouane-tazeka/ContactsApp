//
//  PersonCellModel.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-06.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    var contacts: PersonModel? {
        didSet {
            if let name = contacts?.name, let surname = contacts?.surname {
                nameLabel.text = name + " " + surname
            }
            if let profilePicture = contacts?.profilePicture {
                imageViewLabel.image = UIImage(named: profilePicture)
            }
        }
    }
    
    let imageViewLabel: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "contactPic")
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Merouane"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        backgroundColor = .cellColor
        
//        layer.borderWidth = CGFloat(0.2)
        layer.cornerRadius = CGFloat(16)
        
        addSubview(imageViewLabel)
        imageViewLabel.layer.cornerRadius = self.frame.width / 4
        imageViewLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        imageViewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        imageViewLabel.heightAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        imageViewLabel.widthAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        
        addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageViewLabel.bottomAnchor, constant: 25).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
    }
    
}
