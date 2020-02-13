//
//  ConversionCalcLabel.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 2/13/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

class ConversionCalcLabel: UILabel {

    override func awakeFromNib() {
        //foreground color
        
        guard let text = self.text else {
            return
        }
        
        self.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: FOREGROUND_COLOR])
        
    }

}
