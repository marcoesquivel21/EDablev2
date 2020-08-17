//
//  ElectionsViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/11/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class ElectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    var searching = false
    @IBOutlet weak var electionTable: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var elecList:[Elections]?
    var sortedElectList:[Elections] = [Elections]()
    var searchingElections:[Elections]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searching{
            return sortedElectList.count
        }else{
            return searchingElections!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if !searching{
            cell.textLabel?.text = sortedElectList[indexPath.row].name!
            cell.detailTextLabel?.text = sortedElectList[indexPath.row].electionDay!
            cell.selectionStyle = .none
        }else{
            cell.textLabel?.text = searchingElections![indexPath.row].name!
            cell.detailTextLabel?.text = searchingElections![indexPath.row].electionDay!
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingElections = sortedElectList.filter({$0.name!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        electionTable.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        electionTable.reloadData()
    }
    
    
    func sortList(){
        sortedElectList = sortedElectList.sorted(by: {$0.name! < $1.name!})
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        elecList?.remove(at: 0)
        sortedElectList = elecList!
        sortList()
        electionTable.dataSource = self
        electionTable.delegate = self
        searchBar.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.searchBar.endEditing(true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
        self.searchBar.endEditing(true)
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
