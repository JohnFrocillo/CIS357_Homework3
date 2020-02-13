//
//  ConversionCalcButton.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 2/13/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

class ConversionCalcButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = FOREGROUND_COLOR
        //foreground
        guard let text = self.currentTitle else {
            return
        }
        
        self.setAttributedTitle(NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: BACKGROUND_COLOR]), for: .normal)
        
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
    }

}
