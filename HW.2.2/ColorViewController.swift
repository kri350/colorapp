//
//  ColorViewController.swift
//  HW.2.2
//
//  Created by Кристина Андреева on 07.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewBackgroundColor(for newBackgroundColor: UIColor)
}

class ColorViewController: UIViewController {
    
private var newBackgroundColor = UIColor (
    red: 0,
    green: 0,
    blue: 0,
    alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = newBackgroundColor
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.newBackgroundColor = newBackgroundColor
//        settingsVC.delegate = self
    }
//    extension ColorViewController: SettingsViewControllerDelegate {
//        func setNewBackgroundColor (for newBackgroundColor: UIColor) {
//            self.newBackgroundColor = newBackgroundColor
//        }
//    }
}
