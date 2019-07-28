//
//  WalkthroughVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/8/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit

class WalkthroughVC: UIViewController, WalkThroughPageViewControllerDelegate {
    
    // MARK:- Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.masksToBounds = true
            
        }
        
    }
    
    @IBOutlet var skipButton: UIButton!
    
    // Mark:- Properties
    
    var walkThroughPageViewController: WalkthroughPageViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK:- Actions
    
    @IBAction func skipButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewWalkThrough")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if let index = walkThroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkThroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewWalkThrough")
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        
        updateUI()
        
    }
    
    //MARK:- View controller life cycle
    func updateUI() {
        if let index = walkThroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("Next", for: .normal)
                skipButton.isHidden = false
                
            case 2:
                nextButton.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
            default:
                break
            }
            pageControl.currentPage = index
            
        }
    }
    
    func didUpdatepageIndex(currentIndex: Int) {
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkThroughPageViewController = pageViewController
            walkThroughPageViewController?.walkThroughDelegate = self
        }
    }

} //end WalkthroughVC
