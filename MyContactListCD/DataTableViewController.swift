//
//  DataTableViewController.swift
//  MyContactListCD
//
//  Created by Elizabeth Fallin on 5/19/16.
//  Copyright © 2016 Cascadia College. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {
    
    var listData = ["Jim", "John", "Dana", "Rosie"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        
    cell.textLabel?.text = listData[indexPath.row];
    return cell}

}