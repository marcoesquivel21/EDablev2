//
//  ViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/6/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var txtFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for b in buttonList{
            b.layer.cornerRadius = 20.0
        }
        for t in txtFields{
            t.layer.cornerRadius = 20.0
        }
        
        
        
       
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        var moveSize = self.view.frame.height - txtFields[0].frame.origin.y
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            for t in txtFields{
                if t.tag == 1{
                    moveSize = self.view.frame.size.height - t.frame.origin.y
                }
            }
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= moveSize
                self.view.frame.origin.y += 346.0
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func backToHome(segue: UIStoryboardSegue){
        
    }


}

