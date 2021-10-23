//
//  ViewController.swift
//  HW.2.2
//
//  Created by Кристина Андреева on 23.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tintView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tintView.layer.cornerRadius = 15
    }

    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.3f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.3f", greenSlider.value)
    }
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.3f", blueSlider.value)
        
    }
}

