//
//  ViewController.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 1/30/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, settingsViewControllerDelegate {
    
    @IBOutlet weak var appTitle: UILabel!
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
        if mode == "length" {
            enterYards.placeholder = "Enter Length"
            enterMeters.placeholder = "Enter Length"
        }
        else {
            enterYards.placeholder = "Enter Volume"
            enterMeters.placeholder = "Enter Volume"
        }
        dismissKeyboard()
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
        dismissKeyboard()
        
        var tUnit = ""
        var fUnit = ""
        
        var newLabel: UITextField = enterYards
        var fromVal = 0.0
        var continueFlag = true
        
        if enterYards.text!.isEmpty && enterMeters.text!.isEmpty {
            enterYards.placeholder = "Enter a valid number!"
            enterMeters.placeholder = "Enter a valid number!"
            continueFlag = false
        }
        
        if enterYards.text!.isEmpty && continueFlag{
            fromVal = Double(enterMeters.text!)!
            newLabel = enterYards
            tUnit = fromUnit.text!
            fUnit = toUnit.text!
        }
        else if continueFlag{
            fromVal = Double(enterYards.text!)!
            newLabel = enterMeters
            tUnit = toUnit.text!
            fUnit = fromUnit.text!
        }
        
        var toVal = 0.0
        
        if mode == "length" {
            if tUnit == "Meters" && fUnit == "Meters" {
                let convKey =  LengthConversionKey(toUnits: .Meters, fromUnits: .Meters)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Meters" && fUnit == "Yards" {
                let convKey = LengthConversionKey(toUnits: .Meters, fromUnits: .Yards)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Meters" && fUnit == "Miles" {
                let convKey = LengthConversionKey(toUnits: .Meters, fromUnits: .Miles)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Yards" && fUnit == "Meters" {
                let convKey = LengthConversionKey(toUnits: .Yards, fromUnits: .Meters)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Yards" && fUnit == "Yards" {
                let convKey = LengthConversionKey(toUnits: .Yards, fromUnits: .Yards)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Yards" && fUnit == "Miles" {
                let convKey = LengthConversionKey(toUnits: .Yards, fromUnits: .Miles)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Miles" && fUnit == "Meters" {
                let convKey = LengthConversionKey(toUnits: .Miles, fromUnits: .Meters)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Miles" && fUnit == "Yards" {
                let convKey = LengthConversionKey(toUnits: .Miles, fromUnits: .Yards)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
            else if tUnit == "Miles" && fUnit == "Miles" {
                let convKey = LengthConversionKey(toUnits: .Miles, fromUnits: .Miles)
                toVal = fromVal * lengthConversionTable[convKey]!
            }
        }
        else {
            if tUnit == "Liters" && fUnit == "Liters" {
                let convKey =  VolumeConversionKey(toUnits: .Liters, fromUnits: .Liters)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Liters" && fUnit == "Gallons" {
                let convKey = VolumeConversionKey(toUnits: .Liters, fromUnits: .Gallons)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Liters" && fUnit == "Quarts" {
                let convKey = VolumeConversionKey(toUnits: .Liters, fromUnits: .Quarts)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Gallons" && fUnit == "Liters" {
                let convKey = VolumeConversionKey(toUnits: .Gallons, fromUnits: .Liters)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Gallons" && fUnit == "Gallons" {
                let convKey = VolumeConversionKey(toUnits: .Gallons, fromUnits: .Gallons)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Gallons" && fUnit == "Quarts" {
                let convKey = VolumeConversionKey(toUnits: .Gallons, fromUnits: .Quarts)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Quarts" && fUnit == "Liters" {
                let convKey = VolumeConversionKey(toUnits: .Quarts, fromUnits: .Liters)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Quarts" && fUnit == "Gallons" {
                let convKey = VolumeConversionKey(toUnits: .Quarts, fromUnits: .Gallons)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            else if tUnit == "Quarts" && fUnit == "Quarts" {
                let convKey = VolumeConversionKey(toUnits: .Quarts, fromUnits: .Quarts)
                toVal = fromVal * volumeConversionTable[convKey]!
            }
            
        }
        
        if(continueFlag) {
            newLabel.text = String(toVal)
        }
        
    }
    
    @IBAction func save(segue: UIStoryboardSegue) {
        //Unwind back to here from 'Save' button
        enterYards.text = ""
        enterMeters.text = ""
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
        
    }

    @IBAction func modeClicked(_ sender: UIButton) {
        if self.mode == "length" {
            self.mode = "volume"
            self.fromUnit.text = "Gallons"
            self.toUnit.text = "Liters"
            self.appTitle.text = "Volume Conversion Calculator"
            enterYards.placeholder = "Enter Volume"
            enterMeters.placeholder = "Enter Volume"
        }
        else {
            self.mode = "length"
            self.fromUnit.text = "Yards"
            self.toUnit.text = "Meters"
            self.appTitle.text = "Length Conversion Calculator"
            enterYards.placeholder = "Enter Length"
            enterMeters.placeholder = "Enter Length"
        }
        
        enterYards.text = ""
        enterMeters.text = ""
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
