//
//  TableViewController.swift
//  MusicApp
//
//  Created by Arystan on 11.03.2025.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var arrayMusic = [MusicItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let search = UISearchController()
        
        search.searchBar.delegate = self
        
        search.searchBar.placeholder = "Search music"
        
        navigationItem.searchController = search
        
        
        searchMusic(term: "Eminem")
    }
    
    func searchMusic(term: String) {
        SVProgressHUD.show()
        
        let parameters = ["term": term,
                          "limit": 25] as [String: Any]
        
        
        AF.request("https://itunes.apple.com/search", method: .get, parameters: parameters).responseData { response in
            SVProgressHUD.dismiss()
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                
                if let array = json["results"].array {
                    for item in array {
                        let music = MusicItem(json: item)
                        
                        self.arrayMusic.append(music)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        arrayMusic.removeAll()
        tableView.reloadData()
        searchMusic(term: searchBar.text!)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMusic.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MusicTableViewCell

        // Configure the cell...

        cell.setData(music: arrayMusic[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.musicURL = arrayMusic[indexPath.row].previewUrl
        
        navigationController?.show(vc, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
