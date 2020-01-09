//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Anil on 10/31/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //updating label
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color

    }
    

    @IBAction func recalculateLabel(_ sender: UIButton) {
        //to dismiss the segue
        dismiss(animated: true, completion: nil)
    }
    
   
}
