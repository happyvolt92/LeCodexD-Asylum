//
//  FormViewController.swift
//  Miawouf
//
//  Created by Sam on 10/06/2022.
//

import UIKit

class FormViewController: UIViewController {
    
    var dog: Pet!
    
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    @IBAction func validate(_ sender: Any) {
        let pet = createPetObject()
        performSegue(withIdentifier: "segueToSuccess", sender: pet)
    }
    
    private func createPetObject () -> Pet {
       let name = nameTextField.text
       let phone = phoneTextField.text
       let genderIndex = genderSegmentedControl.selectedSegmentIndex
       let gender: Pet.Gender = (genderIndex == 0) ? .male : .female
       let hasMajority = majoritySwitch.isOn
       let raceIndex = racePickerView.selectedRow(inComponent: 0)
       let race = catRaces[raceIndex]
       
      return Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess" {
            let successVC = segue.destination as? SuccessViewController
            let pet = sender as? Pet
            successVC?.pet = pet
        }
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
