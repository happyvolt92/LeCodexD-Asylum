//
//  FormViewController.swift
//  Miawouf
//
//  Created by Sam on 10/06/2022.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}

extension FormViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
}

extension FormViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
}

extension FormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
