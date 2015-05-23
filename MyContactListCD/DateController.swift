//
//  DateController.swift
//  MyContactListCD
//
//  Created by Brian Bansenauer on 5/18/15.
//  Copyright (c) 2015 Cascadia College. All rights reserved.
//

import Foundation
import UIKit

// Protocol for UIDatePicker and Reminder Segmented Control
protocol DateControllerDelegate{
    func dateChanged(date:NSDate)
    func indexChanged(foo:Int)
}


class DateController:UIViewController {
    // Birthdate picker control
    @IBOutlet weak var pckDate: UIDatePicker!
    // Reminder Segmented Control
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // Delegate
    var delegate:DateControllerDelegate?;
    
    override func viewDidLoad() {
        let saveButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Save,
            target: self,
            action: "saveDate" )
            
        
        self.navigationItem.setRightBarButtonItem(saveButton, animated: false)
        self.title = "Pick Birthdate"
    }
    
    // Save data - added indexchanged function
    @IBAction func saveDate(){
        delegate?.dateChanged(pckDate.date)
        delegate?.indexChanged(segmentedControl.selectedSegmentIndex)
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
}