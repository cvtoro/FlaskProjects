//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Cecilia  Villatoro on 1/21/16.
//  Copyright © 2016 Cecilia  Villatoro. All rights reserved.
//
import Foundation
import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{

    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
        

        
//        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
//        
//        switch hour {
//        case 6..<12 : print(NSLocalizedString("Morning", comment: "Morning"))
//        case 12 : print(NSLocalizedString("Noon", comment: "Noon"))
//        case 13..<17 :  self.view.backgroundColor = UIColor(hue: 0.6083, saturation: 0.49, brightness: 0.1, alpha: 1.0)
//        case 17..<22 :  self.view.backgroundColor = UIColor(hue: 0.6083, saturation: 0.65, brightness: 0.1, alpha: 1.0) //evening
//        default:  self.view.backgroundColor = UIColor(hue: 0.6083, saturation: 0.65, brightness: 0.1, alpha: 1.0)  //night time
//        }
//       
//        
        
    }
    
    @IBOutlet var celsiusLabel: UILabel!
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheightValue: Double? {
        didSet{
            updateCelciusLabel()
        }
    }
    
    var celsiusValue: Double?{
        if let value = fahrenheightValue{
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    func updateCelciusLabel(){
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
            
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    func textField(textField: UITextField,
            shouldChangeCharactersInRange range: NSRange,
            replacementString string: String) -> Bool{
       let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".")
       let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
                
        if existingTextHasDecimalSeperator != nil &&
            replacementTextHasDecimalSeparator != nil{
                return false
        }
        else{
            return true
        }
                
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, value = Double(text){
            fahrenheightValue = value
        }else{
            fahrenheightValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        //get rid of keyboard
        textField.resignFirstResponder()
    }
    
    
}
