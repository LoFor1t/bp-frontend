//
//  UserModel.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import Foundation

class UserModel: ObservableObject {
    var name: String
    var email: String
    var cardId: String
    
    var nameError: String?
    var emailError: String?
    var cardIdError: String?
    
    init(name: String = "", email: String = "", cardId: String = "") {
        self.name = name
        self.email = email
        self.cardId = cardId
    }
    
    func validate() -> Bool {
        return nameError == nil && emailError == nil && cardIdError == nil
    }
}
