//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Naman Sabarwal on 27/09/23.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Analytics.trackEvent("navigated_to_calculator")
        if Crashes.hasCrashedInLastSession {
            //show alert to apologize when the user opens the app after the last crash of the app
        }
    }

    @IBAction func actionCalculate(_ sender: UIButton) {
        // Crashes.generateTestCrash()
        
        let currentAge = Int(ageTextField.text ?? "") ?? 0
        let retirementAge = Int(retirementAgeTextField.text ?? "") ?? 0
        
        let properties = ["current_age": String(currentAge),
                          "retirement_age": String(retirementAge)]
        Analytics.trackEvent("calculate_retirement_calculated", withProperties: properties)
    }
}

