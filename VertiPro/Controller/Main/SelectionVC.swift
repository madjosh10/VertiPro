//
//  SelectionVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/27/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit

class SelectionVC: UIViewController {

    @IBOutlet weak var questionSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var movementSegmentControl: UISegmentedControl!
    @IBOutlet weak var exerciseModeSegmentControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new view controller using segue.destination.
        //Pass the selected object to the new view controller.
        
        let destVC: ExercisesVC = segue.destination as! ExercisesVC
        
        destVC.dataFromSelection = "\n*****DATA PASSED WORKING AS EXPECTED****\n"
        destVC.choseMovement = Int(movementSegmentControl.selectedSegmentIndex)
        
        
    }
    
    @IBAction func goClicked(_ sender: UIButton) {
        // To Exercises Storyboard, to start the proceedure
        print("Starting Exercises")
        performSegue(withIdentifier: "toExercises", sender: self)
        
        
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
