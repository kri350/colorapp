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
        setColor()
        setValue(for: redValue, greenValue, blueValue)
    }


    @IBAction func redSliderChanged() {
        setColor()
        redValue.text = string(from: redSlider)
    }
    
    @IBAction func greenSliderChanged() {
        setColor()
        greenValue.text = string(from: greenSlider)
    }
    
    @IBAction func blueSliderChanged() {
        setColor()
        blueValue.text = string(from: blueSlider)
    }
    
    private func setColor() {
        tintView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValue:
                redValue.text = string(from: redSlider)
            case greenValue:
                greenValue.text = string(from: greenSlider)
            default:
                blueValue.text = string(from: blueSlider)
            }
        }
    }
    
   private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }


    @IBAction func doneButtonTapped() {
//        delegate.setNewBackgroundColor(for: )
    }
}

