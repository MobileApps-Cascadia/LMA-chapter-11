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
    
    //send pick date back to contact view controller
    @IBAction func saveDate(){
        delegate?.dateChanged(pckDate.date)
        self.navigationController?.popViewControllerAnimated(true)
    }
}