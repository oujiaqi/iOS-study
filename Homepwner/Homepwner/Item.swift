//
//  Item.swift
//  Homepwner
//
//  Created by colinou on 2017/9/11.
//  Copyright © 2017年 colinou. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = NSDate()
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = Int(arc4random() % 3)
            let randomAdjective = adjectives[Int(idx)]
            
            idx = Int(arc4random() % 3)
            let randomNoun = nouns[idx]
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random())
            let randomSerialNmuber = NSUUID().uuidString.components(separatedBy: "-").first
            self.init(name: randomName,
                      serialNumber: randomSerialNmuber,
                      valueInDollars: randomValue)
        }
        else {
            self.init(name:"", serialNumber: nil, valueInDollars: 0)
        }
    }
}
