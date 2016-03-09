//
//  TableWithEditIconsController.swift
//  UITableViewRowEditIcon
//
//  Created by Lawrence F MacFadyen on 2015-10-28.
//  Copyright © 2015 LawrenceM. All rights reserved.
//

import UIKit

class TableWithEditIconsController: UITableViewController {
    
    var books = [Book(title: "The Swift Programming Language (Swift 2)", author: "Apple Inc."), Book(title: "Swift Algorithms and Data Structures", author: "Wayne Bishop"), Book(title: "Advanced Swift", author: "Chris Eidhof/Airspeed Velocity"), Book(title: "iOS Programming", author: "Big Nerd Ranch"), Book(title: "Test-Driven iOS Development With Swift", author: "Dr. Dominik Hauser") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 56.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        setEditing(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:BookTableViewCell = tableView.dequeueReusableCellWithIdentifier("bookCell") as! BookTableViewCell

        let book = books[indexPath.row]
            
        cell.authorLabel.text = "- " + book.author
        cell.titleLabel.text = book.title
            
        if(tableView.editing && self.tableView(tableView, canEditRowAtIndexPath: indexPath))
        {
            cell.buttonView.hidden = false
            cell.buttonWidth.constant = cell.bounds.size.width * 0.1
        }
        else
        {
            cell.buttonWidth.constant = 0
            cell.buttonView.hidden = true
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            books.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.reloadData()
    }

}
