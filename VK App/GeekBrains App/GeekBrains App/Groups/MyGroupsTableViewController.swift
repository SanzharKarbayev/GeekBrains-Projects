//
//  MyGroupsTableViewController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 02.02.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var myGroups = [GroupModel()]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myGroups.remove(at: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as! MyGroupsCellTableViewCell

        let myGroup = myGroups[indexPath.row]
        cell.groupImage.image = myGroup.groupImage
        cell.groupName.text = myGroup.groupName
        
        return cell
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "AddGroup" {
            guard let allGroupsController = segue.source as? AllGroupsTableViewController else {
                return
            }
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                let addedGroup = allGroupsController.groupsList[indexPath.row]
                
                if !myGroups.contains(where: { (group) -> Bool in
                    return group.groupName == addedGroup.groupName && group.groupImage == addedGroup.groupImage
                })  {
                    myGroups.append(addedGroup)
                    tableView.reloadData()
                }
            }
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
