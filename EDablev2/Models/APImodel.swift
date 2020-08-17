//
//  APImodel.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/8/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import Foundation


struct OfficesResponse: Decodable{
    let offices: [Offices]
}

struct Offices: Decodable {
    let name: String?
    let divisionId: String?
    let officialIndices: [Int]?
}

struct OfficialResponse: Decodable{
    let officials: [Officials]
}

struct Address: Decodable{
    var line1:String?
    var city:String?
    var state:String?
    var zip:String?
}

struct Social: Decodable{
    var type:String?
    var id:String?
}

struct ElectionResponse: Decodable{
    let elections:[Elections]
}

struct Elections: Decodable{
    var name:String?
    var electionDay:String?
}

struct Officials: Decodable{
    let name:String?
    let party:String?
    var office:String?
    var phones: [String]?
    var emails: [String]?
    var address:[Address]?
    var channels:[Social]?
    var photoUrl:String?
}

enum CivicError:Error{
    case noDataAvailable
    case cannotProcessData
}

var officesTest:OfficesResponse?
var officialsTest:OfficialResponse?
var electionsTest:ElectionResponse?


struct ElectionRequest {
    let resourceURL:URL
    let API_KEY = "AIzaSyCnckjLGNLJMIwshHkp2jFVDst7z-9_wKo"
    init(){
        let resourceString = "https://www.googleapis.com/civicinfo/v2/elections?key=\(API_KEY)"
        guard let resourceURL = URL(string: resourceString) else{fatalError()}
        print(resourceURL)
        self.resourceURL = resourceURL
    }
    
    func getElections(completion: @escaping(Result<[Elections], CivicError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){(data, response, error) in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                electionsTest = try JSONDecoder().decode(ElectionResponse.self, from: jsonData)
                let electionDetails = electionsTest?.elections
                print(electionDetails?[0].electionDay ?? "No Office")
                completion(.success((electionDetails ?? nil)!))
            }catch{
                completion(.failure(.cannotProcessData))
            }
            
            

        }
        dataTask.resume()
    }
}



struct CivicRequest{
    let resourceURL:URL
    let API_KEY = "AIzaSyCnckjLGNLJMIwshHkp2jFVDst7z-9_wKo"
    
    init (state:String, address:String, zip:String, city:String){
        let fullAddress:String = address + " " + city + " " + state + " " + zip
        let resourceAddress = fullAddress.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let resourceString = "https://www.googleapis.com/civicinfo/v2/representatives?address=\(resourceAddress ?? "AZ")&includeOffices=true&key=\(API_KEY)"
        
        guard let resourceURL = URL(string: resourceString) else{fatalError()}
        //print(resourceURL)
        self.resourceURL = resourceURL
    }
    
    
    func getOffices(completion: @escaping(Result<[Offices], CivicError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){(data, response, error) in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                officesTest = try JSONDecoder().decode(OfficesResponse.self, from: jsonData)
                let officesDetails = officesTest?.offices
                print(officesTest!.offices[5].name ?? "No Office")
                completion(.success((officesDetails ?? nil)!))
            }catch{
                completion(.failure(.cannotProcessData))
            }
            
            

        }
        dataTask.resume()
    }


    func getOfficials(completion: @escaping(Result<[Officials], CivicError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){(data, response, error) in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                officialsTest = try JSONDecoder().decode(OfficialResponse.self, from: jsonData)
                let officialsDetails = officialsTest?.officials
                print(officialsDetails![5].name!)
                completion(.success((officialsDetails ?? nil)!))
            }catch{
                completion(.failure(.cannotProcessData))
            }
            
        }
        dataTask.resume()
    }

}
