//
//  ViewController.swift
//  WhatsappNotificationControls
//
//  Created by Reuben Simphiwe Kuse on 2023/05/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messageNotificationArray = ["Show Notifications", "Sound", "Reaction Notifications"]
    var groupNotificationArray = ["Show Notifications", "Reaction Notifications"]
    var manageNotificationArray = ["In-App Notification"]
    var managePreviewMessageNotificationArray = ["Show Preview"]
    var manageResetNotificationSettingArray = ["Reset Notification Settings"]
    
    lazy var notificationTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        title = "Notifications"
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        view.addSubview(notificationTableView)
        notificationTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        notificationTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        notificationTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func registerCells() {
        notificationTableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "NotificationTableViewCellID")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return messageNotificationArray.count
        } else if section == 1 {
            return groupNotificationArray.count
        } else if section == 2 {
            return manageNotificationArray.count
        } else if section == 3 {
            return managePreviewMessageNotificationArray.count
        } else {
            return manageResetNotificationSettingArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCellID", for: indexPath) as! NotificationTableViewCell
            notificationCell.titleLabel.text = messageNotificationArray[indexPath.row]
            if indexPath.row == 1 {
                notificationCell.backgroundColor = UIColor.white
                notificationCell.accessoryType = .disclosureIndicator
                notificationCell.titleLabel.textColor = UIColor.black
                notificationCell.notificationSwitch.isHidden = true
            } else {
                notificationCell.backgroundColor = UIColor.white
                notificationCell.accessoryType = .none
                notificationCell.titleLabel.textColor = UIColor.black
            }
            return notificationCell
            
        } else if indexPath.section == 1 {
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCellID", for: indexPath) as! NotificationTableViewCell
            notificationCell.titleLabel.text = groupNotificationArray[indexPath.row]
            return notificationCell
            
        } else if indexPath.section == 2 {
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCellID", for: indexPath) as! NotificationTableViewCell
            notificationCell.titleLabel.text = manageNotificationArray[indexPath.row]
            if indexPath.row == 0 {
                notificationCell.backgroundColor = UIColor.white
                notificationCell.accessoryType = .disclosureIndicator
                notificationCell.titleLabel.textColor = UIColor.black
                notificationCell.notificationSwitch.isHidden = true
            } else {
                notificationCell.backgroundColor = UIColor.white
                notificationCell.accessoryType = .none
                notificationCell.titleLabel.textColor = UIColor.black
            }
            return notificationCell
            
        } else if indexPath.section == 3 {
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCellID", for: indexPath) as! NotificationTableViewCell
            notificationCell.titleLabel.text = managePreviewMessageNotificationArray[indexPath.row]
            return notificationCell
            
        } else {
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCellID", for: indexPath) as! NotificationTableViewCell
            notificationCell.titleLabel.text = manageResetNotificationSettingArray[indexPath.row]
            if indexPath.row == 0 {
                notificationCell.backgroundColor = UIColor.white
                notificationCell.accessoryType = .none
                notificationCell.titleLabel.textColor = UIColor.systemRed
                notificationCell.notificationSwitch.isHidden = true
            } else {
                notificationCell.backgroundColor = UIColor.white
                notificationCell.accessoryType = .none
                notificationCell.titleLabel.textColor = UIColor.systemRed
            }
            return notificationCell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(48.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 1 {
            let soundAlertTonesController = UINavigationController(rootViewController: SoundViewController())
            soundAlertTonesController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(soundAlertTonesController, animated: true)
        }
        if indexPath.section == 2 && indexPath.row == 0 {

            self.navigationController?.pushViewController(InAppNotificationController(), animated: true)
        }
        
    }
}
