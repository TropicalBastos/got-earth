//
//  SettingsViewController.swift
//  got-earth
//
//  Created by Ian Bastos on 08/05/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    var primaryFont: UIFont!
    var secondaryFont: UIFont!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primaryFont = UIFont(name: "GodOfWar", size: 18)
        secondaryFont = UIFont(name: "Work Sans SemiBold", size: 14)
        
        navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: primaryFont!]
        
        closeButton.action = #selector(closeSettings)
    }

    @objc
    func closeSettings() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
