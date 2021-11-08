//
//  ColorViewController.swift
//  HW.2.2
//
//  Created by Кристина Андреева on 07.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor (_ color: UIColor)
}

class ColorViewController: UIViewController {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
        
    }
}
extension ColorViewController: SettingsViewControllerDelegate {
    func setColor (_ color: UIColor) {
            view.backgroundColor = color
        }
    }




