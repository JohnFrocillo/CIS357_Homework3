//
//  SettingsViewController.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 2/4/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

protocol settingsViewControllerDelegate {
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit)
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var fromUnitsSelection: String = "Yards"
    var toUnitsSelection: String = "Meters"
    var delegate: settingsViewControllerDelegate?
    
    var toSelected: Bool = false
    var fromSelected: Bool = false
    
    @IBOutlet weak var fromUnits: UILabel!
    @IBOutlet weak var toUnits: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerData = ["Yards", "Meters", "Miles"]
        self.picker.delegate = self
        self.picker.dataSource = self
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.fromLabelTapped(_:)))
        self.fromUnits.isUserInteractionEnabled = true
        self.fromUnits.addGestureRecognizer(labelTap)
        
        let labelTap2 = UITapGestureRecognizer(target: self, action: #selector(self.toLabelTapped(_:)))
        self.toUnits.isUserInteractionEnabled = true
        self.toUnits.addGestureRecognizer(labelTap2)
        
        let closePicker = UITapGestureRecognizer(target: self, action: #selector(self.dismissPicker))
        self.view.addGestureRecognizer(closePicker)
        
    }
    
    @objc func fromLabelTapped(_ sender: UITapGestureRecognizer) {
        //set flags
        fromSelected = true
        toSelected = false
        picker.isHidden = false
    }
    
    @objc func toLabelTapped(_ sender: UITapGestureRecognizer) {
        fromSelected = false
        toSelected = true
        picker.isHidden = false
    }
    
    @objc func dismissPicker() {
        picker.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.settingsChanged(fromUnits: LengthUnit(rawValue: fromUnitsSelection)!, toUnits: LengthUnit(rawValue: toUnitsSelection)!)
        }
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(toSelected) {
            self.toUnitsSelection = self.pickerData[row]
        }
        else if(fromSelected) {
            self.fromUnitsSelection = self.pickerData[row]
        }
        
        self.fromUnits.text = fromUnitsSelection
        self.toUnits.text = toUnitsSelection

    }
}
