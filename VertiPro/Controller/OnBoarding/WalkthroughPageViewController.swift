//
//  WalkthroughPageViewController.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/2/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit

protocol WalkThroughPageViewControllerDelegate: class {
    func didUpdatepageIndex(currentIndex: Int)
}


class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - Properties
    weak var walkThroughDelegate: WalkThroughPageViewControllerDelegate?
    
    var pageHeadings = ["Header 1", "Header 2", "Header 3"]
    var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    var pageSubHeading = ["Keep your vertigo Health organized", "Quickly track with simple steps", "Lets get started!"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the Data Source and the delegate to itself
        dataSource = self
        delegate = self
        
        
        // create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Page View Controller DataSource Methods
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentVC).index
        index -= 1
        
        return contentViewController(at: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentVC).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentVC? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentVC") as? WalkthroughContentVC {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeading[index]
            
            return pageContentViewController
        }
        
        return nil
        
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page View Controller Delegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentVC {
                currentIndex = contentViewController.index
                
                walkThroughDelegate?.didUpdatepageIndex(currentIndex: currentIndex)
            }
        }
    }
    
    
} // end WalkthroughPageViewController class
