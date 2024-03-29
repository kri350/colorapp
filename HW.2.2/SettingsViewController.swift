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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tintView.layer.cornerRadius = 15
        
        tintView.backgroundColor = viewColor
        
        setSliders()
        
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
    

    @IBAction func doneButtonPressed() {
        delegate?.setColor(tintView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

extension SettingsViewController {

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

    private func setSliders () {
        let ciColor = CIColor (color: viewColor)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
   
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redValue)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenValue)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueValue)
            }
            
            setColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}


    
    

