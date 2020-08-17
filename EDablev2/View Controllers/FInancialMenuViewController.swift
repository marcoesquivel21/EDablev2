//
//  FInancialMenuViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 4/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class FInancialMenuViewController: UIViewController {

    @IBOutlet var navButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for b in navButtons{
            b.layer.cornerRadius = 20.0
        }
        // Do any additional setup after loading the view.
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
