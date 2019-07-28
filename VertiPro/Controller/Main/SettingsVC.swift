//
//  SettingsVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/24/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var about: String = "This app is a tool that can be used to train the brain.\nIt is designed to help the user improve gaze stabilzation, co-ordination and balance.\nVOR can be used for therapeutic of performance enhancement goals."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        about = descriptionLabel.text ?? "Hello"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
