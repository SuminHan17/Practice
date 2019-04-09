//
//  ViewController.swift
//  Practice
//
//  Created by 한수민 on 02/04/2019.
//  Copyright © 2019 한수민. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var buttonNewYear: UIButton!
    @IBOutlet var buttonMemorial: UIButton!
    @IBOutlet var buttonIndependence: UIButton!
    @IBOutlet var buttonChristmas: UIButton!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var hiddenView: UIView!
    
    let yearMonthArray : Array<String> = ["1월 1일", "6월 6일", "8월 15일", "12월 25일"]
    var started : Bool!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearMonthArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return yearMonthArray[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        started = false
        hiddenView.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonStart(_ sender: UIButton) {
        started = true
        self.activityIndicator.startAnimating()
        self.hiddenView.isHidden = true
    }
    
    
    @IBAction func buttonHoliday(_ sender: UIButton) {
        let index = self.pickerView.selectedRow(inComponent: 0)
        if started == true {
            if ((sender == self.buttonNewYear) && index == 0 || (sender == self.buttonMemorial) && index == 1 || (sender == self.buttonIndependence) && index == 2 || (sender == self.buttonChristmas) && index == 3) {
                hiddenView.isHidden = false
                self.activityIndicator.stopAnimating()
                started = false
            }
            else {
                hiddenView.isHidden = true
            }
        }
    }
    
}

