//
//  User.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 7/18/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import Foundation

struct User {
    var username: String?
    var email: String?
    var password: String?
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
        
    } // end User init 
    
} // end User Struct
