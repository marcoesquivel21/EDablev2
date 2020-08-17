//
//  EducationModel.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/10/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import Foundation

class Education {
    var unis:[Units] = [Units]()
    let u1:Units = Units(i: "notDone.png", t: "Unit 2: Government Branches", m: ["Executive", "Judicial", "Legislative", "Checks and Balances"], s: "Branches of U.S. Government", l: "In this unit you will learn about the use of the three branches of government within the United States. Click on a branch below to begin. ")
    init(){
        unis.append(u1)
    }
}

class Units{
    var mods:[String]
    let imageName:String
    let Title:String
    let shortDesc:String
    let longDesc:String
    init(i: String, t: String, m: [String], s: String, l: String){
        mods = m
        imageName = i
        Title = t
        shortDesc = s
        longDesc = l
    }
}

class Modules{
    
}


