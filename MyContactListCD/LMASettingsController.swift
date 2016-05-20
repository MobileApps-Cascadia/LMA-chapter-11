//
//  LMASettingsController.swift
//  MyContactList
//
//  Created by Brian Bansenauer on 5/17/15.
//  Copyright (c) 2015 Cascadia College. All rights reserved.
//

import Foundation
import UIKit

class LMASettingsController:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var pckSortField: UIPickerView!
    @IBOutlet weak var swAscending: UISwitch!

    @IBAction func sortDirectionChanged(sender: AnyObject) {
    }
    
    let sortOrderItems = ["Name","City","Birthday"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pckSortField.dataSource = self
        pckSortField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        //Set the UI based on the settings data
        
        let settings = NSUserDefaults.standardUserDefaults();
        
        //set UIPickerView to the value matching its settings Data
        /*for (index, item) in enumerate(sortOrderItems) {
            if(item == settings.stringForKey("sortField")){
                pckSortField.selectedRowInComponent(index);
            }
        }*/
        
        //set the switch to the value matchin its settings data
        swAscending.setOn(settings.boolForKey("sortDirectionAscending"), animated: false)
    }
    
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortOrderItems.count;
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortOrderItems[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NSLog("Chosen item is: %@", sortOrderItems[row]);
    }

    
}


