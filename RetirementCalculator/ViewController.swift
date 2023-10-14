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
    @IBOutlet weak var monthlyInvestmentTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
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

    //MARK: - Button action -
    @IBAction private func actionCalculate(_ sender: UIButton) {
        // This is to generate crash through crashlytics
        // Crashes.generateTestCrash()
        
        let currentAge = Int(ageTextField.text ?? "") ?? 0
        let retirementAge = Int(retirementAgeTextField.text ?? "") ?? 0
        let monthlyInvestment = Double(monthlyInvestmentTextField.text ?? "") ?? 0.0
        let currentSavings = Double(savingsTextField.text ?? "") ?? 0.0
        let interestRate = Double(interestRateTextField.text ?? "") ?? 0.0
        
        let retirementAmount = calculateRetirementAmount()
        //Setting result text
        resultLabel.text = "If you save $\(monthlyInvestment) every month for \(retirementAge - currentAge) years, and invest that money plus your current investment of \(currentSavings) at \(interestRate)% annual interest rate, you will have $\(retirementAmount) by the time you are \(retirementAge)"
        
        let properties = ["current_age": String(currentAge),
                          "retirement_age": String(retirementAge)]
        Analytics.trackEvent("calculate_retirement_calculated", withProperties: properties)
    }
    
    private func calculateRetirementAmount() -> Double {
        //write retirement amount logic here
        1000
    }
}

