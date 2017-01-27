//
//  ProblemVC.swift
//  MenuProgram
//
//  Created by Phyllis Hollingshead on 4/22/15.
//  Copyright (c) 2015 Phyllis Hollingshead. All rights reserved.
//

import UIKit

class ProblemVC: UIViewController {
    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblResults: UILabel!
    @IBOutlet weak var lblAnswer: UITextField!
    @IBOutlet weak var lblCorrect: UILabel!
    @IBOutlet weak var lblWrong: UILabel!
    
    var num1:UInt32 = 0
    var num2:UInt32 = 0
    var newSign: String = "+"
    var correct = 0
    var wrong = 0
    
    @IBAction func btnGetNew(_ sender: UIButton) {
        
        lblAnswer.text = ""
        num1 = arc4random() % 101
        num2 = arc4random() % 101
        let sign = arc4random() % 4
        
        if sign == 0
        {
            newSign = "+"
            lblNum1.text = "\(num1)  +  \(num2)"
        }
        else if sign == 1
        {
            newSign = "-"
            if num1 < num2 {
                let temp = num1
                num1 = num2
                num2 = temp
                lblNum1.text = "\(num1)  -  \(num2)"
            }else
            {
                lblNum1.text = "\(num1)  -  \(num2)"
            }
        }
        else if sign == 2
        {
            newSign = "*"
            lblNum1.text = "\(num1)  *  \(num2)"
        }
        else
        {
            newSign = "/"
            if num1 < num2 {
                let temp = num1
                num1 = num2
                num2 = temp
                lblNum1.text = "\(num1)  /  \(num2)"
            }else
            {
                lblNum1.text = "\(num1)  /  \(num2)"
            }
        }
       lblAnswer.becomeFirstResponder()
    }
    @IBAction func btnCheckAnswer(_ sender: UIButton) {
        var correctAnswer:UInt32 = 0
        
        view.endEditing(true)
        
        if lblAnswer.text == ""
        {
            lblResults.text = "You must enter an answer before \ntapping Check Answer"
        }
        else if lblNum1.text == "Problem will appear here"
        {
            lblResults.text = "You must tap Get New Problem before \n tapping Check Answer"
        }
        else
        {
            let strAnswer = lblAnswer.text!
            let answer: UInt32 = UInt32(strAnswer)!
            
            if newSign == "+"
            {
                correctAnswer = num1 + num2
            }
            else if newSign == "-"
            {
                correctAnswer = num1 - num2
            }
            else if newSign == "*"
            {
                correctAnswer = num1 * num2
            }
            else
            {
                if num2 == 0
                {
                    correctAnswer = 0
                }
                else
                {
                    correctAnswer = num1 / num2
                }
            }

            if answer == correctAnswer
            {
                lblResults.text = "Correct! You are doing great!"
                correct += 1
                lblCorrect.text = "\(correct)"
                lblAnswer.text = ""
                lblNum1.text = "Problem will appear here"
                
            }
            else
            {
                wrong += 1
                lblWrong.text = "\(wrong)"
                lblResults.text = "Wrong. \n\(num1) \(newSign) \(num2) =  \(correctAnswer). \nDon't get discouraged. \nKeep trying."
                lblAnswer.text = ""
                lblNum1.text = "Problem will appear here"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
