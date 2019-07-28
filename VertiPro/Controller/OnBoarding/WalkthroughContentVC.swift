//
//  OnBoardingVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 6/15/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit

class WalkthroughContentVC: UIViewController {
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subheadingLabel: UILabel! {
        didSet {
            subheadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    // MARK: - Properties
    
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = heading
        subheadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)

        // Do any additional setup after loading the view.
    }
    

} // end WalthroughContentVC
