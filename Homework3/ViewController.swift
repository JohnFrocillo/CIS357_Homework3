//
//  ViewController.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 1/30/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var enterYards: UITextField!
    @IBOutlet weak var enterMeters: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        //make this controller the delegate of the text fields
        self.enterYards.delegate = self
        self.enterMeters.delegate = self
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func clearClicked(_ sender: UIButton) {
        enterYards.text = ""
        enterMeters.text = ""
        dismissKeyboard()
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
        dismissKeyboard()
        var temp: Double
        if enterYards.hasText && !enterMeters.hasText {
            temp = Double(enterYards.text!)!
            temp = temp * 0.9144
            enterMeters.text! = String(temp)
        }
        else if !enterYards.hasText && enterMeters.hasText {
            temp = Double(enterMeters.text!)!
            temp = temp * 1.09361
            enterYards.text! = String(temp)
        }
            
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.enterYards {
            self.enterMeters.text = ""
        }
        else if textField == self.enterMeters {
            self.enterYards.text = ""
        }
    }
}
