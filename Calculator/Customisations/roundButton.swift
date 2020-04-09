//
//  roundButton.swift
//  Calculator
//
//  Created by Vraj Mehta on 09/04/2020
//

import UIKit

@IBDesignable

class roundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        
        didSet {
            
            if roundButton {
                
                layer.cornerRadius = frame.height / 2
                
            }
            
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        if roundButton {
            
            layer.cornerRadius = frame.height / 2
            
        }
        
    }

}
