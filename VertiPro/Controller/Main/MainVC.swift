//
//  ViewController.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 5/24/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit
import ARKit

class MainVC: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device")
        }
        sceneView.delegate = self
        
        
//        if dataFromSelection != nil {
//            startingExercise()
//        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARFaceTrackingConfiguration()
        sceneView.session.run(configuration)
        
        // Making sure the application has been opened once
        // if not then it will run OnBoarding with UserDefaults
        if UserDefaults.standard.bool(forKey: "hasViewWalkThrough") {
            return
        }
        
        // giving access to the storyboard so it can show the correct
        // storyboard view
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        if let walkThroughVC = storyboard.instantiateViewController(withIdentifier: "WalkthroughVC") as? WalkthroughVC {
            present(walkThroughVC, animated: true, completion: nil)
            
        }
        
    }
    
//    func startingExercise() {
//        buttonStack.isHidden = true
//
//
//    }
    
//    func choosingExercise() {
//        switch choseMovement?.selectedSegmentIndex {
//        case 0:
//            print("DOING ALL")
//        case 1:
//            leftArrow.isHidden = false
//            rightArrow.isHidden = false
//        case 2:
//            topArrow.isHidden = false
//            bottomArrow.isHidden = false
//        default:
//            break;
//        }
//    } // end choosingExercise
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    
}


extension MainVC: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        var device: MTLDevice!
        device = MTLCreateSystemDefaultDevice()
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.fillMode = .lines
        
        return node
    }
    
    func renderer(
        _ renderer: SCNSceneRenderer,
        didUpdate node: SCNNode,
        for anchor: ARAnchor) {
        
        guard let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
                return
        }
        faceGeometry.update(from: faceAnchor.geometry)
    }
    
}


