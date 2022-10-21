//
//  Character.swift
//  BB Qotes
//
//  Created by Elisei Bobocea on 29/06/2022.
//

import Foundation

struct Character: Codable {
    let name: String
    let birthday: String
    let occupation: [String]
    let img: URL
    let nickname: String
    let portrayed: String
    
    var image: URL {
        return img
    }
    
    var portrayedBy: String {
        return portrayed
    }
}
