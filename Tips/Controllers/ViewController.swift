//
//  ViewController.swift
//  Tips
//
//  Created by MA SHAO I on 2022/3/2.
//

import UIKit




class ViewController: UIViewController {
    
    var calculator:Tip = Tip()
    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var splitValue: UIStepper!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnNumpad(textField: billTotal)
        zeroTip.setTitle("0%", for: .normal)
        tenPercent.setTitle("10%", for: .normal)
        twentyPercent.setTitle("20%", for: .normal)
        tenPercent.backgroundColor = UIColor(red: 205/255, green: 201/255, blue: 195/255, alpha: 0.2)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipSeleccion(_ sender: UIButton) {
        switch sender.currentTitle {
         case "0%":
            calculator.tip = 0.0
            tenPercent.backgroundColor = nil
            twentyPercent.backgroundColor = nil
         case "10%":
            calculator.tip = 0.10
            zeroTip.backgroundColor = nil
            twentyPercent.backgroundColor = nil
            
         case "20%":
            calculator.tip = 0.20
            zeroTip.backgroundColor = nil
            tenPercent.backgroundColor = nil
                     
         default:
            calculator.tip = 0.10
        }
        sender.backgroundColor = UIColor(red: 205/255, green: 201/255, blue: 195/255, alpha: 0.2)
        print("the tip is: \(calculator.tip)")
    }
    @IBAction func changeSplitLabel(_ sender: UIStepper) {
        splitLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        if let totalCount = Float(billTotal.text!){
            calculator.calculateTheTip(total: totalCount, split: Int(splitValue.value))
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.totalTip = String(format: "%.2f", calculator.tipTotal)
        destinationVC.tip = calculator.getDescription()
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func addDoneButtonOnNumpad(textField: UITextField) {
            
            let keypadToolbar: UIToolbar = UIToolbar()
            
            // add a done button to the numberpad
            keypadToolbar.items=[
                UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder)),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            ]
            keypadToolbar.sizeToFit()
            // add a toolbar with a done button above the number pad
            textField.inputAccessoryView = keypadToolbar
        }


}

