//
//  LocalGovViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class LocalGovViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet weak var offTableView: UITableView!
    
    var searchingNames:[Officials]?
    var searching = false
    var tempOfficials = [Officials]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchingNames!.count
        }else{
            return tempOfficials.count
        }
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if searching{
            cell.textLabel?.text = searchingNames![indexPath.row].name!
            cell.detailTextLabel?.text = searchingNames![indexPath.row].office!
        }else{
            cell.textLabel?.text = tempOfficials[indexPath.row].name!
            cell.detailTextLabel?.text = tempOfficials[indexPath.row].office ?? "N/A"
        }
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offTableView.delegate = self
        offTableView.dataSource = self
        searchBar.delegate = self
        
        print(tempOfficials[0].name!)
        // Do any additional setup after loading the view.
    }
    
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = tempOfficials.filter({$0.name!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        offTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        offTableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.searchBar.endEditing(true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
        self.searchBar.endEditing(true)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var tempOF:Officials?
        if segue.identifier == "toDetail"{
            let selectedIndex: IndexPath = self.offTableView.indexPath(for: sender as! UITableViewCell)!
            if !searching{
                tempOF = tempOfficials[selectedIndex.row];
            }else{
                tempOF = searchingNames![selectedIndex.row];
            }
            if segue.identifier == "toDetail"{
                if let destination = segue.destination as? DetailViewController{
                    destination.of = tempOF
                }
            }
        }
    }
    
    @IBAction func returnToTableView(segue: UIStoryboardSegue){
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
