//
//  ConversionCalcTextField.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 2/13/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

class ConversionCalcTextField: DecimalMinusTextField {
    
    override func awakeFromNib() {
        self.tintColor = FOREGROUND_COLOR
        self.backgroundColor = BACKGROUND_COLOR.withAlphaComponent(0.5)
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        
        guard let ph = self.placeholder else {
            return
        }
        
        
        self.attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor: FOREGROUND_COLOR])
        self.textColor = FOREGROUND_COLOR
        
    }
    
    

}
