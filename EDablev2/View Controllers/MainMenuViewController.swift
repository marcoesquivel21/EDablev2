//
//  MainMenuViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet var buttonOutlets: [UIButton]!
    
    var divRe:CivicRequest?
    var state:String?
    var tempOffices = [Offices]()
    var tempOfficials = [Officials]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for b in buttonOutlets{
            b.layer.cornerRadius = 20
        }
        
        divRe!.getOffices{ [weak self] result in
                          switch result{
                          case .failure(let error):
                              print(error)
                          case .success(let offices):
                            self!.tempOffices = offices
                            print(self!.tempOffices[0].name!)
        //                    DispatchQueue.main.async {
        //                       self?.performSegue(withIdentifier: "localGovInfo", sender: sender)
        //                   }
                        }
                }
        divRe!.getOfficials{ [weak self] result in
                          switch result{
                          case .failure(let error):
                              print(error)
                          case .success(let officials):
                            self!.tempOfficials = officials
                            print(self!.tempOfficials[0].name!)
        //                    DispatchQueue.main.async {
        //                            self?.performSegue(withIdentifier: "localGovInfo", sender: sender)
        //                    }
                        }
                }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCivic"{
            if let destination = segue.destination as? CivicViewController{
                for i in 0..<tempOffices.count{
                    for j in 0..<tempOffices[i].officialIndices!.count{
                        tempOfficials[tempOffices[i].officialIndices![j]].office = tempOffices[i].name
                    }
                }
                destination.tempOfficials = tempOfficials
                destination.state = state
            }
        }
    }
    

    @IBAction func returnToMainMenu(segue: UIStoryboardSegue){
        
    }

}
