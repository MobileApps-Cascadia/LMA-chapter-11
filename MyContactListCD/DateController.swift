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
    func dateChanged(date:NSDate, reminder:NSString)
}

class DateController:UIViewController {
    @IBOutlet weak var pckDate: UIDatePicker!
    
    var delegate:DateControllerDelegate?;
    
    override func viewDidLoad() {
        let saveButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Save,
            target: self,
            action: "saveDate" )
            
        
        self.navigationItem.setRightBarButtonItem(saveButton, animated: false)
        self.title = "Pick Birthdate"
    }
    @IBOutlet weak var lblReminder: UISegmentedControl!
    
    //send pick date back to contact view controller
    @IBAction func saveDate(){
        let reminder: NSString
        if(lblReminder.selectedSegmentIndex == 1)
        {
            reminder = "One Week"
        }else if(lblReminder.selectedSegmentIndex == 2){
            reminder = "Two Week"
        }
        else{ reminder = "None"}
        
        delegate?.dateChanged(pckDate.date, reminder: reminder)
        self.navigationController?.popViewControllerAnimated(true)
    }
}