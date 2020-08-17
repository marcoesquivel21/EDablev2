//
//  EDUDetailViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/11/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class EDUDetailViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    @IBOutlet var lessonButtons: [UIButton]!
    
    var un:Units?
    let checkString = "Checks\n &\n Balances"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = un!.Title
        longDescription.text = un!.longDesc
        for b in lessonButtons{
            switch b.tag {
            case 3:
                b.layer.cornerRadius = 15.0
            default:
                b.layer.cornerRadius = 15.0
            }
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
