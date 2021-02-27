//
//  UserSingleton.swift
//  GeekBrains App
//
//  Created by Sanzhar on 25.02.2021.
//

import Foundation

class Session {
    
    static let instace = Session()
    
    private init() {}
    
    var token = String()
    var userId = Int()
    
}
