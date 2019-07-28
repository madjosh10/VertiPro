//
//  ExercisesVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/27/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit
import ARKit

class ExercisesVC: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var topArrow: ARSCNView!
    @IBOutlet weak var bottomArrow: ARSCNView!
    @IBOutlet weak var leftArrow: ARSCNView!
    @IBOutlet weak var rightArrow: ARSCNView!
    
    @IBOutlet weak var dotLabel: UILabel!
    
    
    var dataFromSelection: String = ""
    var choseMovement: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device")
        }
        sceneView.delegate = self
        
        dotLabel.layer.masksToBounds = true
        dotLabel.layer.cornerRadius = 10
        
        startingExercise(movement: choseMovement ?? 3)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARFaceTrackingConfiguration()
        sceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    
    
    func startingExercise(movement: Int) {
        switch movement {
        case 0:
            print("All is starting")
        case 1:
            topAndDown()
        case 2:
            leftAndRight()
        default:
            break
        }
        
    }
    
    func topAndDown() {
        topArrow.isHidden = false
        bottomArrow.isHidden = false
        
    }
    
    func leftAndRight() {
        leftArrow.isHidden = false
        rightArrow.isHidden = false
        
    }
    
    func allArrows() {
        topAndDown()
        leftAndRight()
        
    }
    
    

} // end ExercisesVC class

extension ExercisesVC: ARSCNViewDelegate {
    
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
    
} // end Extension
