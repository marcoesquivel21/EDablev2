//
//  EDUMainViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/11/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit


class EDUMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let edu:Education = Education()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        edu.unis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eduCell", for: indexPath) as! EDUTableViewCell
        cell.tableTitle.text = edu.unis[indexPath.row].Title
        cell.tableDescription.text = edu.unis[indexPath.row].shortDesc
        cell.tableImage.image = UIImage(named: "Icon awesome-check-circle@3x.png")
        cell.selectionStyle = .none
        return cell
    }
    
   
    

    @IBOutlet weak var unitTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        unitTable.dataSource = self
        unitTable.delegate = self
        unitTable.rowHeight = 75.0
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUnitDetails"{
            let selectedIndex: IndexPath = self.unitTable.indexPath(for: sender as! EDUTableViewCell)!
            if let destination = segue.destination as? EDUDetailViewController{
                destination.un = edu.unis[selectedIndex.row]
            }
        }
    }
    
    @IBAction func returnToUnits(segue: UIStoryboardSegue){
        
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
