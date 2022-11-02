//
//  EmployeeCell.swift
//  no strbrd
//
//  Created by Adlet Zhantassov on 30.10.2022.
//

import Foundation
import UIKit

class EmployeeCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    var nameLabel = UILabel()
    var phoneNumberLabel = UILabel()
    let skillsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupNameLabel()
        setupPhoneNumberLabel()
        setupSkillsLabel()
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    func setupPhoneNumberLabel() {
        addSubview(phoneNumberLabel)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        phoneNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    func setupSkillsLabel() {
        addSubview(skillsLabel)
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        skillsLabel.font = skillsLabel.font.withSize(10)
        skillsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        skillsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
    }
    
}
