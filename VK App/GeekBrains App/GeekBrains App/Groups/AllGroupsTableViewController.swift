//
//  AllGroupsTableViewController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 02.02.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    var groupsList = [
        GroupModel(groupName: "Кино", groupImage: UIImage(systemName: "film")!),
        GroupModel(groupName: "Игры", groupImage: UIImage(systemName: "gamecontroller")!)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsTableViewCell
        
        let group = groupsList[indexPath.row]
        cell.groupImage.image = group.groupImage
        cell.groupName.text = group.groupName

        return cell
    }
}
