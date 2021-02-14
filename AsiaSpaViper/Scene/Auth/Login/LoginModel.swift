//
//  LoginModel.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 13/02/2021.
//

import Foundation
// MARK: - ISOIDModel
struct ISOIDModel: Codable {
    let key, value: String
    let data: [ISOIDData]
}

// MARK: - Datum
struct ISOIDData: Codable {
    let id: Int
    let name: String
}

struct IsoViewModel {
    
    var name : String
    
    init(iso: ISOIDData) {
        name = (iso.name)
    }
}


// MARK: - Login
struct Login: Codable {
    let key, value : String?
    let data: LoginData?
}

// MARK: - LoginData
struct LoginData: Codable {
    var id: Int?
    var name: String?
    var isoID: Int?
    var iso, email, phoneWithoutISO, phone: String?
    var avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isoID = "iso_id"
        case iso, email
        case phoneWithoutISO = "phone_without_iso"
        case phone, avatar
    }
}

struct LoginViewModel {
    
    var phone , name : String?
    var id : Int?
    
    init(login: LoginData) {
        phone = (login.phone)
        name = login.name
        id = login.id
    }
}
// MARK: - LoginFailedModel
struct LoginErrorModel: Codable {
    let key, value, msg: String
}
