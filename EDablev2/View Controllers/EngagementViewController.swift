//
//  EngagementViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class EngagementViewController: UIViewController {
    
    fileprivate let application = UIApplication.shared
    
    var state:String?
    let elect:ElectionRequest = ElectionRequest()
    var tempElections:[Elections] = [Elections]()
    let registerLinks:Register = Register()
    
    var tempOfficials = [Officials]()
    @IBOutlet var buttonsRef: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        //set button corener radious
        for b in buttonsRef{
            b.layer.cornerRadius = 20.0
        }
        
        elect.getElections{ [weak self] result in
                          switch result{
                          case .failure(let error):
                              print(error)
                          case .success(let elections):
                            self!.tempElections = elections
                            }
                }
        //print(self.tempElections[0].electionDay)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLocalGov"{
            if let destination = segue.destination as? LocalGovViewController{
                destination.tempOfficials = tempOfficials
            }
        }
        if segue.identifier == "toElections"{
            if let destination = segue.destination as? ElectionsViewController{
                destination.elecList = tempElections
            }
        }
    }
    
    @IBAction func returnToEngag(segue: UIStoryboardSegue){
        
    }
    

    @IBAction func upcomingElections(_ sender: Any) {
        performSegue(withIdentifier: "toElections", sender: sender)
    }
    
    @IBAction func registerToVote(_ sender: Any) {
        if let registerlURL = URL(string: registerLinks.registerDic[state!]!){
            if application.canOpenURL(registerlURL){
                application.open(registerlURL, options: [:], completionHandler: nil)
            }
        }
    }
    
}
