//
//  CategoryViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-24.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var categoryPicker: UIPickerView!
    
    let categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewController = segue.destination as! ViewController
        ViewController.displayCategory = "\(categories)"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategories = categories[row] as String

        print(selectedCategories)

    }



}
