//
//  DesignableView.swift
//  VertiPro
//
//  Created by Joshua Madrigal on 6/6/19.
//  Copyright © 2019 joshuamadrigal. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
            
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
            
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
            
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
            
        }
    }
    
    
}
