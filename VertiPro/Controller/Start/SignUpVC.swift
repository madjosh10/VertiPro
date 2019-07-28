//
//  SignUpVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/18/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        usernameTextField.tintColor = UIColor.white
        usernameTextField.textColor = #colorLiteral(red: 0.983650744, green: 0.7725929022, blue: 0.008622190915, alpha: 1)
        emailTextField.tintColor = UIColor.white
        emailTextField.textColor = #colorLiteral(red: 0.983650744, green: 0.7725929022, blue: 0.008622190915, alpha: 1)
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = #colorLiteral(red: 0.983650744, green: 0.7725929022, blue: 0.008622190915, alpha: 1)
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: usernameTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
        
        bottomLayer(textField: usernameTextField)
        bottomLayer(textField: emailTextField)
        bottomLayer(textField: passwordTextField)
        
    } // end updateUI
    
    func bottomLayer(textField: UITextField) {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0.0, y: 35.0, width: 325, height: 0.6)
        bottomLayer.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(bottomLayer)
        
    }
    
    @IBAction func signUpClicked(_ sendeR: UIButton) {
        //authentication code in firebase
        guard let email = emailTextField.text , email.isNotEmpty,
                    let password = passwordTextField.text , password.isNotEmpty else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                    
                    guard let user = authResult?.user else { return }
                    
                    if let error = error {
                        debugPrint(error.localizedDescription)
                    } else {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "MainVC")
                        self.present(controller, animated: true,completion: nil)
                        print("*****************************Working badboyyyyyyyyy")
                        
                    }
                    
                }
    }
    
    @IBAction func alreadyHaveAccount(_ sender: UIButton) {
        //dismissing view controller
        dismiss(animated: true, completion: nil)
    }
    

} // end SignUpVC
