//
//  ViewController.swift
//  HW.2.2
//
//  Created by Кристина Андреева on 23.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
        
    @IBOutlet var tintView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var delegate: SettingsViewControllerDelegate!
    var newBackgroundColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tintView.layer.cornerRadius = 15
        tintView.backgroundColor = newBackgroundColor
    }

    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.2f", redSlider.value)
        tintView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        tintView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1)
    }
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        tintView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1)
    }

}

