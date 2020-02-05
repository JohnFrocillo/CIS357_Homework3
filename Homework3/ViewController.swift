//
//  ViewController.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 1/30/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, settingsViewControllerDelegate {
    
    @IBOutlet weak var fromUnit: UILabel!
    @IBOutlet weak var toUnit: UILabel!
    var mode: String = "length"
    
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit) {
        //update the main screen's labels
        if(mode == "length") {
            self.fromUnit.text = fromUnits.rawValue
            self.toUnit.text = toUnits.rawValue
        }
        
    }
    
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit) {
        //update the main screen's labels
        if(mode == "volume") {
            self.fromUnit.text = fromUnits.rawValue
            self.toUnit.text = toUnits.rawValue
        }
    }
    
    
    
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
    
    @IBAction func save(segue: UIStoryboardSegue) {
        //Unwind back to here from 'Save' button
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            let dest = segue.destination as! UINavigationController
            let next = dest.viewControllers[0] as! SettingsViewController
            next.delegate = self
            next.fromUnitsSelection = self.fromUnit.text!
            next.toUnitsSelection = self.toUnit.text!
            
            //pass the mode to the settings view
            next.mode = self.mode
        }
        
        /*
        if segue.identifier == "settingsSegue" {
            if let dest = segue.destination as? SettingsViewController {
                dest.delegate = self
            }
        }*/
    }

    @IBAction func modeClicked(_ sender: UIButton) {
        if self.mode == "length" {
            self.mode = "volume"
            self.fromUnit.text = "Gallons"
            self.toUnit.text = "Liters"
        }
        else {
            self.mode = "length"
            self.fromUnit.text = "Yards"
            self.toUnit.text = "Meters"
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
