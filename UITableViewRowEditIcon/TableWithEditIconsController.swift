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
        tableView.rowHeight = UITableView.automaticDimension
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setEditing(false, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:BookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell

        let book = books[indexPath.row]
            
        cell.authorLabel.text = "- " + book.author
        cell.titleLabel.text = book.title
            
        if(tableView.isEditing && self.tableView(tableView, canEditRowAt: indexPath))
        {
            cell.buttonView.isHidden = false
            cell.buttonWidth.constant = cell.bounds.size.width * 0.1
        }
        else
        {
            cell.buttonWidth.constant = 0
            cell.buttonView.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.reloadData()
    }

}
