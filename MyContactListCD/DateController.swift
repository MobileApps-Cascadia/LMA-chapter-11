//
//  DateController.swift
//  MyContactListCD
//
//  Created by Brian Bansenauer on 5/18/15.
//  Copyright (c) 2015 Cascadia College. All rights reserved.
//

import Foundation
import UIKit

protocol DateControllerDelegate{
    func dateChanged(date:NSDate)
    func indexChanged(remind:Int)
}

class DateController:UIViewController {
    @IBOutlet weak var pckDate: UIDatePicker!
    
    @IBOutlet weak var pckReminder: UISegmentedControl!
    
    
    
        var delegate:DateControllerDelegate?;
    
    
    override func viewDidLoad() {
        let saveButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Save,
            target: self,
            action: "saveDate" )
            
        
        self.navigationItem.setRightBarButtonItem(saveButton, animated: false)
        self.title = "Pick Birthdate"
    }
    @IBAction func saveDate(){
        delegate?.dateChanged(pckDate.date)
        delegate?.indexChanged(pckReminder.selectedSegmentIndex)
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
}