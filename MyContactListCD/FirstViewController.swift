//
//  FirstViewController.swift
//  MyContactList
//
//  Created by Brian Bansenauer on 5/4/15.
//  Copyright (c) 2015 Cascadia College. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, DateControllerDelegate {

    @IBOutlet weak var myScroll: UIScrollView!
    
    // variables for text fields
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtCell: UITextField!
    @IBOutlet weak var txtHomePhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    
    // variable for reminder label
    @IBOutlet weak var lblReminder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // View or Edit Segmented Control to enable or disable editing contacts
    @IBAction func changeEditMode(sender: AnyObject) {
        
        let controls = [txtName,txtAddress,txtCity,txtState,txtZip,txtCell,txtHomePhone,txtEmail]
        
        for control in controls{
            if (sender.selectedSegmentIndex == 0) {
                control.enabled=false
                control.borderStyle = UITextBorderStyle.None
                btnChange.enabled = false
                
            } else {
                control.enabled=true
                control.borderStyle = UITextBorderStyle.RoundedRect
                btnChange.enabled = true
            }
        }
    }
    
    // Function for date change and date formatting change
    func dateChanged(date: NSDate) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        lblBirthday.text = dateFormatter.stringFromDate(date)
        
    }
    
    // Function for reminder change - added
    func indexChanged(foo:Int) {
        
        switch foo       {
        case 0:
            lblReminder.text = "None";
        case 1:
            lblReminder.text = "One week";
        case 2:
            lblReminder.text = "Two week";
        default:
            break;
        }
    }
    
    // prepareForSegue function
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("In Segue: %@", segue.identifier!)

    if(segue.identifier == "segueContactDate"){
        let dateController:DateController = segue.destinationViewController as DateController
        dateController.delegate = self
    }
    }

}

