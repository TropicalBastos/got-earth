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
    @IBOutlet weak var locationImage: UIImageView!
    
    var locationTitleString: String?
    var locationDescString: String?
    var locationImageUri: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.topItem?.title = locationTitleString
        locationDesc.text = locationDescString
        // Do any additional setup after loading the view.
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
