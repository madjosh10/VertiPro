//
//  SignInVC.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 6/2/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        emailTextField.tintColor = UIColor.white
        emailTextField.textColor = #colorLiteral(red: 0.983650744, green: 0.7725929022, blue: 0.008622190915, alpha: 1)
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = #colorLiteral(red: 0.983650744, green: 0.7725929022, blue: 0.008622190915, alpha: 1)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 1.0, alpha: 0.7)])
        
        bottomLayer(textField: emailTextField)
        bottomLayer(textField: passwordTextField)
        
    }

    func bottomLayer(textField: UITextField) {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0.0, y: 35.0, width: 325, height: 0.6)
        bottomLayer.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(bottomLayer)
        
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        
        guard let email = emailTextField.text , email.isNotEmpty,
                    let password = passwordTextField.text , password.isNotEmpty else { return }
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
          guard let strongSelf = self else { return }
            
            if let error = error {
                            let alert = UIAlertController(title: "Bad input or Information doesn't exist", message: error.localizedDescription, preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                            alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
            //                debugPrint("************** \(error.localizedDescription)\n")
                            
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "MainVC")
                    self?.present(controller, animated: true,completion: nil)
                    print("*****************************Working badboyyyyyyyyy")
                            
                } // end if let statement
            
            
        } // end Auth()
        
//        performSegue(withIdentifier: "toSignUp", sender: self)
        
    } // end signUpClicked()
    
    @IBAction func forgotPasswordClicked(_ sender: UIButton) {
            guard let email = emailTextField.text else { return }
                   Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                       if let error = error {
                           debugPrint(error.localizedDescription)
                       }
                       if email.isEmpty {
                           let alert = UIAlertController(title: "Forgot Password", message: "Need to input an Email", preferredStyle: .alert)
                           let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                           alert.addAction(ok)
                           self.present(alert,animated: true, completion: nil)
                           
                       } else {
                           
                           let alert = UIAlertController(title: "Forgot Password", message: "Check email for password", preferredStyle: .alert)
                           let okBtn = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                           alert.addAction(okBtn)
                           self.present(alert,animated: true, completion: nil)
                       }
                   }
    }

} // end SignInVC class
