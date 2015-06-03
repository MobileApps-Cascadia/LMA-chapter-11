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
    @IBAction func saveDate(){
        delegate?.dateChanged(pckDate.date)
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    @IBAction func remindIt(sender: AnyObject) {
        if (remindMeNot.selectedSegmentIndex == 0){
            for(UILabel*reminder in labels){
                FirstViewController.reminder.text = "None" //I didn't know how to implement this part of the code
            }
        }
        else if (remindMeNot.selectedSegmentIndex == 1){
            for (UILabel*reminder){
                FirstViewController.reminder.text = "One Week"
            }
        }
        else if (remindMeNot.selectedSegmentIndex == 2){
            for(UILabel*reminder){
                FirstViewController.reminder.text = "Two Weeks"
            }
        }
    }
    @IBOutlet weak var remindMeNot: UISegmentedControl!
    
    
}