//
//  CivicViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class CivicViewController: UIViewController {
    
    @IBOutlet var buttonsRef: [UIButton]!
    var tempOfficials = [Officials]()
    var state:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        for b in buttonsRef{
            b.layer.cornerRadius = 20.0
        }
        print(tempOfficials[0].name!)
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEngag"{
            if let destination = segue.destination as? EngagementViewController{
                destination.tempOfficials = tempOfficials
                destination.state = state
            }
        }
    }
    
    @IBAction func returnToCivic(segue: UIStoryboardSegue){
        
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
