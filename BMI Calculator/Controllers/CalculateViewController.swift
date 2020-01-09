//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //creating object named calculatorBrain from CalculatorBrain structure
    var calculatorBrain = CalculatorBrain()
    

    //linked all IBOutlet of UI with CalculateViewController
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        //(sender.value) for this code we can check the slider current value
                       
        let height = String(format: "%.2f", sender.value)// to use this code reduce to two decimal place
        //update heightLabel for showing height
        heightLabel.text = "\(height)m"
       
    }
    

    @IBAction func weightSliderChanged(_ sender: UISlider) {
         
        let weight = String(format: "%.0f", sender.value)
         weightLabel.text = "\(weight)kg"
        
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        //to get value from height and weight slider use (heightSlider.value or sender.value)
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //calling method for calculating bmi
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        //to go segue. used segue name to go to particulare segue
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            //to target which view controller mentioned/specify path of viewController
            let destinationVc = segue.destination as! ResultViewController
            //after mentioned destination we can assess all properties of ResultViewController
            destinationVc.bmiValue = calculatorBrain.getBMIValue()
            destinationVc.advice = calculatorBrain.getAdvice()
            destinationVc.color = calculatorBrain.getColor()
        }
    }
    
    
}

