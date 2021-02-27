//
//  FriendsViewController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 01.02.2021.
//

import UIKit

class FriendsViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchedFriends = [UserModel]()
    var searching = false
    
    var friendsList = [
        UserModel(friendName: "Ирина", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Никита", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Вика", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Амир", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Аслан", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Баха", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Витя", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Коля", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Димаш", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Роман", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Илья", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Серик", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Саруар", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Акмарал", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Султан", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Алиса", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Шолпан", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Анеля", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Браян", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Том", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Симба", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Эрик", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Эльдар", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Фарида", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Зина", friendAvatar: UIImage(systemName: "person")!),
        UserModel(friendName: "Гульнара", friendAvatar: UIImage(systemName: "person")!)]
    
    var sections: [String: [UserModel]] = [:]
    var keys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
        searchBar.delegate = self
        
        friendsList.forEach { friend in
            let firstLetter = String(friend.friendName.first!)
            if sections[firstLetter] != nil {
                sections[firstLetter]!.append(friend)
            } else {
                sections[firstLetter] = [friend]
            }
        }
        keys = Array(sections.keys).sorted(by: <)
        
        self.friendTableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            let count = searchedFriends.count
            
            return count
        }
        let key = keys[section]
        let count = sections[key]!.count

        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendTableView.dequeueReusableCell(withIdentifier: "MyFriendsCell") as! FriendsTableViewCell

        if searching {
            searchedFriends.sort {
                $0.friendName < $1.friendName
            }
            let friend = searchedFriends[indexPath.row]
            cell.setData(name: friend.friendName, avatar: friend.friendAvatar)
        } else {
            searchBar.showsCancelButton = false
            let key = keys[indexPath.section]
            let section = sections[key]![indexPath.row]
            cell.setData(name: section.friendName, avatar: section.friendAvatar)
        }
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
            return 1
        }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searching {
            return ""
        }
        return keys[section]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedFriends = friendsList.filter {
            $0.friendName.range(of: searchText, options: .caseInsensitive) != nil
        }
        searching = true
        searchBar.showsCancelButton = true
        friendTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        searchBar.showsCancelButton = false
        friendTableView.reloadData()
    }
}
