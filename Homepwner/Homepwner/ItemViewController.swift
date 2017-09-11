//
//  ItemViewController.swift
//  Homepwner
//
//  Created by colinou on 2017/9/11.
//  Copyright © 2017年 colinou. All rights reserved.
//

import UIKit

class ItemViewController: UITableViewController {
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(sender: AnyObject) {
            }
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        print("Edit")
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        print("tableView")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("NM")
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "No more items!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}
