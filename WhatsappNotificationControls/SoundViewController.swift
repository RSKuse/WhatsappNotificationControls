//
//  SoundViewController.swift
//  WhatsappNotificationControls
//
//  Created by Reuben Simphiwe Kuse on 2023/05/18.
//

import Foundation
import UIKit

class SoundViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var alertTonesArray = ["None", "Note(Default)", "Aurora", "Bambo", "Chords", "complete"]
    
    lazy var alertTonesTableView: UITableView = {
        let alertTonesTableView = UITableView(frame: .zero, style: .plain)
        alertTonesTableView.dataSource = self
        alertTonesTableView.delegate = self
        alertTonesTableView.separatorInset = UIEdgeInsets(top: 0.0, left: 50, bottom: 0.0, right: 0.0)
        alertTonesTableView.isScrollEnabled = true
        alertTonesTableView.translatesAutoresizingMaskIntoConstraints = false
        return alertTonesTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Sound"
        setupAlertTonesTableViewConstraints()
        registerCells()
        addCloseButton()
    }
    
    func setupAlertTonesTableViewConstraints() {
        view.addSubview(alertTonesTableView)
        
        alertTonesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        alertTonesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        alertTonesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        alertTonesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func registerCells() {
        alertTonesTableView.register(AlertToneViewCell.self,forCellReuseIdentifier: "AlertToneViewCellID")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return alertTonesArray.count
        } else if section == 1 {
            return alertTonesArray.count
        } else if section == 2 {
            return alertTonesArray.count
        } else if section == 3 {
            return alertTonesArray.count
        } else {
            return alertTonesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCell(withIdentifier: "AlertToneViewCellID", for: indexPath) as! AlertToneViewCell
        return userCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(48)
    }
    
    func addCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save,
                                                           target: self,
                                                           action: #selector(composeTweet))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel,
                                                           target: self,
                                                           action: #selector(handleDismiss))
    }
    @objc func handleDismiss() {
        dismiss(animated: true)
    }
    @objc func composeTweet() {
        
    }
}
