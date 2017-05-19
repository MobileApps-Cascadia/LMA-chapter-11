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
    @IBOutlet weak var lblReminder: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeEditMode(_ sender: AnyObject) {
        
        let controls = [txtName,txtAddress,txtCity,txtState,txtZip,txtCell,txtHomePhone,txtEmail]
        
        for control in controls{
            if (sender.selectedSegmentIndex == 0) {
                control?.isEnabled=false
                control?.borderStyle = UITextBorderStyle.none
                btnChange.isEnabled = false
                
            } else {
                control?.isEnabled=true
                control?.borderStyle = UITextBorderStyle.roundedRect
                btnChange.isEnabled = true
            }
        }
    }
    
    func dateChanged(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        lblBirthday.text = dateFormatter.string(from: date)
        
    }
    
    func indexChanged(_ remind:Int)
        {
            switch remind
            {
            case 0: lblReminder.text = "None";
            break;
            case 1: lblReminder.text = "One Week";
            break;
            case 2: lblReminder.text = "Two Weeks";
            break;
            default:
                break;
            }
            
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("In Segue: %@", segue.identifier!)

    if(segue.identifier == "segueContactDate"){
        let dateController:DateController = segue.destination as! DateController
        dateController.delegate = self
    }
    }

}

