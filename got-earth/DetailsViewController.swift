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
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
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
        if (locationImageUri != nil) {
            let imageUrl = Bundle.main.url(forResource: locationImageUri, withExtension: "png")
            let data = try? Data(contentsOf: imageUrl!)
            if let imageData = data {
                if let image = UIImage(data: imageData) {
                    mainImage.image = image
                    locationDesc.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 5).isActive = true
                    self.view.layoutSubviews()
                } else {
                    organizeViewWithoutImage()
                }
            } else {
                organizeViewWithoutImage()
            }
        } else {
            organizeViewWithoutImage()
        }
    }
    
    func organizeViewWithoutImage() {
        mainImage.removeFromSuperview()
        locationDesc.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20).isActive = true
        self.view.layoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        let contentSize = locationDesc.sizeThatFits(locationDesc.bounds.size)
        var frame = locationDesc.frame
        frame.size.height = contentSize.height
        locationDesc.frame = frame
        
        let aspectRatioTextViewConstraint = NSLayoutConstraint(item: locationDesc, attribute: .height, relatedBy: .equal, toItem: locationDesc, attribute: .width, multiplier: locationDesc.bounds.height/locationDesc.bounds.width, constant: 1)
        locationDesc.addConstraint(aspectRatioTextViewConstraint)
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
