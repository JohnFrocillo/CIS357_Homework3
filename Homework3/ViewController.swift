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
    }

    @IBAction func clearClicked(_ sender: UIButton) {
        enterYards.text = ""
        enterMeters.text = ""
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
        var temp: Double
        if enterYards.hasText && !enterMeters.hasText {
           temp = Double(enterYards.text!)!
            print(temp)
        }
            
    }
}

