//
//  Employee.swift
//  Employee-App-Avito Internship
//
//  Created by Adlet Zhantassov on 02.11.2022.
//

import Foundation

import Foundation

public final class MainModel {
    let mainModelObj: Model
    let expiration: Date
    
    init(Model: Model, expiration: Date) {
        self.mainModelObj = Model
        self.expiration = expiration
    }
}

public struct Model: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String?
    let employees: [Employee]?
}

struct Employee: Codable {

    let name: String
    let phone_number: String
    let skills: [String]

}
