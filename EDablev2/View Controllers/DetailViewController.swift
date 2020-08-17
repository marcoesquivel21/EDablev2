//
//  DetailViewController.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let application = UIApplication.shared
    
    var contactOpen = false
    var curentHidden = true
    @IBOutlet weak var contactLabel: UILabel!
    var contactDic:[String:String] = [:]
    var contactArray:[String] = [String]()
    var contactImage:[String] = [String]()
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

    //TABLE VIEW FUNCTIONS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("Contact", for: .normal)
        button.backgroundColor = hexStringToUIColor(hex: "#3C4B5D")
        button.setTitleColor(hexStringToUIColor(hex: "#7FBBD8"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        return button
    }
    
   
    
    @objc func handleExpandClose(){
        contactOpen = !contactOpen
        var indexPaths = [IndexPath]()
        for a in 0..<contactArray.count{
            let index = IndexPath(row: a, section: 0)
            indexPaths.append(index)
        }
        if !contactOpen{
            contactTableView.deleteRows(at: indexPaths, with: .fade)
        }else{
            //contactTableView.insertRows(at: indexPaths, with: .fade)
            contactTableView.reloadData()
            contactTableView.reloadRows(at: indexPaths, with: .fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contactOpen{
            return contactArray.count
        }else{
            return 0
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
        if contactOpen{
            switch contactArray[indexPath.row] {
            case "Twitter":
                cell.contactImage.image = UIImage(named: "Icon awesome-twitter@3x.png")
                cell.contactLabel.text = contactArray[indexPath.row]
                cell.selectionStyle = .none
            case "Facebook":
                cell.contactImage.image = UIImage(named: "Icon awesome-facebook-square@3x.png")
                cell.contactLabel.text = contactArray[indexPath.row]
                cell.selectionStyle = .none
            case "Phone":
                cell.contactImage.image = UIImage(named: "baseline_phone_iphone_black_36pt_3x.png")
                cell.contactLabel.text = contactArray[indexPath.row]
                cell.selectionStyle = .none
            case "Email":
                cell.contactImage.image = UIImage(named: "baseline_email_black_36pt_3x.png")
                cell.contactLabel.text = contactArray[indexPath.row]
                cell.selectionStyle = .none
            default:
                break
            }
        }
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var str = contactDic[contactArray[indexPath.row]]!
        let badCh: Set<Character> = [" ", "(", ")", "-"]
        switch contactArray[indexPath.row]{
        case "Phone":
            str.removeAll(where: {badCh.contains($0)})
            print(str)
            if let  phoneURL = URL(string: "tel://\(str)"){
                if application.canOpenURL(phoneURL){
                    application.open(phoneURL, options: [:], completionHandler: nil)
                }
            }
        case "Email":
            print(contactDic[contactArray[indexPath.row]]!)
            if let emailURL = URL(string: "mailto:\(str)"){
                print("Can create mail url")
                if application.canOpenURL(emailURL){
                    application.open(emailURL, options: [:], completionHandler: nil)
                }
            }
        case "Twitter":
            if let twitterURL = URL(string: "https://twitter.com/\(str)"){
                if application.canOpenURL(twitterURL){
                    application.open(twitterURL, options: [:], completionHandler: nil)
                }
            }
        case "Facebook":
            if let facebookURL = URL(string: "https://facebook.com/\(str)/"){
                if application.canOpenURL(facebookURL){
                    application.open(facebookURL, options: [:], completionHandler: nil)
                }
            }
        default:
            print("Default")
        }
        
        contactTableView.deselectRow(at: indexPath, animated: true)
    }
    
    //OUTLETS AND HELPER METHODS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    @IBOutlet weak var nameLabel: UILabel!
    var addy = ""
    @IBOutlet weak var topItem: UINavigationItem!
    @IBOutlet var topLabels: [UILabel]!
    var of:Officials?
    var imageFail = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        //print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            //print("Download Finished")
            DispatchQueue.main.async() {
                if response?.suggestedFilename != nil{
                    self.imageView.image = UIImage(data: data)
                }else{
                    self.imageView.image = UIImage(named: "baseline_person_black_48pt_3x.png")
                }
            }
        }
    }
    
    func contactInfo(tempOf: Officials) -> ([String : String], [String]){
        var tempContact:[String : String] = [:]
        var tempContactArray:[String] = [String]()
        if tempOf.phones != nil{
            tempContact["Phone"] = tempOf.phones![0]
            tempContactArray.append("Phone")
        }
        if tempOf.emails != nil{
            tempContact["Email"] = tempOf.emails![0]
            tempContactArray.append("Email")
        }
        if tempOf.channels != nil{
            for t in tempOf.channels!{
                if t.id != "YouTube"{
                    tempContact[t.type!] = t.id!
                    tempContactArray.append(t.type!)
                }
            }
        }
        return (tempContact, tempContactArray)
    }
    
    @IBOutlet weak var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactDic = contactInfo(tempOf: of!).0
        contactDic.removeValue(forKey: "YouTube")
        
        contactArray = contactInfo(tempOf: of!).1
        for c in 0..<contactArray.count{
            if contactArray[c] == "YouTube"{
                contactArray.remove(at: c)
            }
        }
        contactTableView.reloadData()
        if of!.address != nil{
            addy = addy + of!.address![0].line1! + "\n"
            addy = addy + of!.address![0].city! + ", "
            addy = addy + of!.address![0].state! + " "
            addy = addy + of!.address![0].zip!
        }
        nameLabel.text = of!.name!
        for t in topLabels{
            switch t.tag {
            case 0:
                t.text = of!.office!
            case 1:
                t.text = of!.party ?? "Party Not Listed"
            case 2:
                if addy != ""{
                    t.text = addy
                }else{
                    t.text = "No Address Given"
                }
            default:
                break
            }
        }
        if (of!.photoUrl != nil){
            let url = URL(string: of!.photoUrl!)
            downloadImage(from: url!)
        }else{
            imageView.image = UIImage(named: "baseline_person_black_48pt_3x.png")
        }
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.rowHeight = 75.0
        
        
        

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
