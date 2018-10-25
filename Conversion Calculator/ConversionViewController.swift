//
//  ConversionViewController.swift
//  Conversion Calculator
//
//  Created by Robert Graman on 10/25/18.
//  Copyright © 2018 Robert Graman. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    let conversions = [ Conversion(label:"fahrenheit to celcius",inputUnit:"°F",outputUnit:"°C"),
                        Conversion(label:"celcius to fahrenheit",inputUnit:"°C",outputUnit:"°F"),
                        Conversion(label:"miles to kilometers",inputUnit:"mi",outputUnit:"km"),
                        Conversion(label:"kilometers to miles",inputUnit:"km",outputUnit:"mi")]
    
    let defaultConvert=0
    
    let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text=conversions[defaultConvert].outputUnit
        inputDisplay.text=conversions[defaultConvert].inputUnit
        
        for x in 0 ... (conversions.count-1){
            alert.addAction(UIAlertAction(title: conversions[x].label, style: UIAlertAction.Style.default, handler: {
                (alertAction)-> Void in
                self.conversion(x)
            }))
        }
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        self.present(alert, animated: true, completion: nil)
    }
    
    func conversion(_ cIndex:Int) -> Void {
        outputDisplay.text = conversions[cIndex].outputUnit
        inputDisplay.text = conversions[cIndex].inputUnit
    }
}
