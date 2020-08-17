//
//  AddressViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    
    var addressTxt = ""
    var cityTxt = ""
    var stateTxt = ""
    var zipTxt = ""
    var divRequest:CivicRequest?
    
   
    @IBOutlet weak var submitRef: UIButton!
    @IBAction func submitButton(_ sender: Any) {
        for a in addressFields{
            switch a.tag {
            case 0:
                addressTxt = a.text ?? ""
            case 1:
                cityTxt = a.text ?? ""
            case 2:
                stateTxt = a.text ?? ""
            case 3:
                zipTxt = a.text ?? ""
            default:
                print("should never happen")
            }
        }
         divRequest = CivicRequest(state: stateTxt, address: addressTxt, zip: zipTxt, city: cityTxt)
        
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toMenu", sender: sender)
        }
    }
    @IBOutlet var addressFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for a in addressFields{
            a.layer.cornerRadius = 20.0
        }
        submitRef.layer.cornerRadius = 20.0
        
        let tap = UITapGestureRecognizer (target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        var moveSize = self.view.frame.height - addressFields[0].frame.origin.y
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            for t in addressFields{
                if t.tag == 3{
                    moveSize = self.view.frame.size.height - t.frame.origin.y
                }
            }
            if self.view.frame.origin.y == 0 {
                print(moveSize)
                self.view.frame.origin.y -= 75.0
                //self.view.frame.origin.y += moveSize
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenu"{
            if let desitnation = segue.destination as? MainMenuViewController{
                desitnation.divRe = divRequest!
                desitnation.state = stateTxt
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func backToAddress(segue: UIStoryboardSegue){
        
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
