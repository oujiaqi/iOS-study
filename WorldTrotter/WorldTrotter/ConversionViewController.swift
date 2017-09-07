//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by ouou on 2017/9/8.
//  Copyright © 2017年 ouou. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    } ()
    
    var fahrenHeitValues: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenHeitValues {
            return (value - 32) * (5 / 9)
        }
        else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value:value))
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    
    @IBAction func fahrenHeitFieldEditingChanged(textField: UITextField) {
//        if !(textField.text?.isEmpty)! {
//            celsiusLabel.text = textField.text
//        }
//        else {
//            celsiusLabel.text = "???"
//        }
        
        if let text = textField.text, let value = Double(text) {
            fahrenHeitValues = value
        }
        else {
            fahrenHeitValues = nil
        }
    }
}
