//
//  DetailsViewController.swift
//  GOT Earth
//
//  Created by Ian Bastos on 19/04/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var locationDesc: UITextView!
    
    var locationTitleString: String?
    var locationDescString: String?
    var locationImageUri: String?
    var primaryFont: UIFont?
    var secondaryFont: UIFont?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set fonts
        primaryFont = UIFont(name: "GodOfWar", size: 18)
        secondaryFont = UIFont(name: "Work Sans SemiBold", size: 14)
        
        navigationBar.topItem?.title = locationTitleString
        navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: primaryFont!]
        
        locationDesc.text = locationDescString
        locationDesc.font = secondaryFont
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationDesc.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetails(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
