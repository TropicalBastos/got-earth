//
//  SettingsViewController.swift
//  got-earth
//
//  Created by Ian Bastos on 08/05/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    var primaryFont: UIFont!
    var secondaryFont: UIFont!
    let cellSpacingHeight = CGFloat(20)
    
    struct LabelStruct {
        var title : String
        var checked : Bool
        var disabled: Bool
    }
    
    var labels: [LabelStruct] = [
        LabelStruct(title: "Show Westeros", checked: true, disabled: false),
        LabelStruct(title: "Show Essos", checked: false, disabled: true),
        LabelStruct(title: "Show Sothoryos", checked: false, disabled: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primaryFont = UIFont(name: "GodOfWar", size: 18)
        secondaryFont = UIFont(name: "Work Sans SemiBold", size: 14)
        
        navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: primaryFont!]
        
        closeButton.action = #selector(closeSettings)
        
        tableViewSetup()
    }

    @objc
    func closeSettings() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableViewSetup() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ShowLabelsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ShowLabelsTableViewCell")
        
        // TODO load prefs and ovveride self.labels data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.labels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: cellSpacingHeight))
        headerView.backgroundColor = UIColor.black
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ShowLabelsTableViewCell", for: indexPath) as! ShowLabelsTableViewCell
        
        cell.label.text = self.labels[indexPath.row].title
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

}
