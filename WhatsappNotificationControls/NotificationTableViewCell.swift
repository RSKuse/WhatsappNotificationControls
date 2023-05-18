//
//  notificationTableViewCell.swift
//  WhatsappNotificationControls
//
//  Created by Reuben Simphiwe Kuse on 2023/05/17.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var notificationSwitch: UISwitch = {
        let notificationSwitch = UISwitch()
        notificationSwitch.isOn = true
        notificationSwitch.isHidden = false
        notificationSwitch.tintColor = .green
        notificationSwitch.translatesAutoresizingMaskIntoConstraints = false
        return notificationSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        setupUI()
        
    }
    
    func setupUI() {
        notificationSwitch.frame = CGRect(x: 5, y: 5, width: 100, height: contentView.frame.size.height-10)
        addSubview(titleLabel)
        addSubview(notificationSwitch)
        
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        notificationSwitch.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        notificationSwitch.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}

