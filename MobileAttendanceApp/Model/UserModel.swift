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
    var companyModel: CompanyModel
    
    @Published var nameError: String?
    @Published var emailError: String?
    @Published var cardIdError: String?
    
    init(name: String = "", email: String = "", cardId: String = "", companyModel: CompanyModel) {
        self.name = name
        self.email = email
        self.cardId = cardId
        self.companyModel = companyModel
    }
    
    func validate() -> Bool {
        nameValidation()
        emailValidation()
        
        return nameError == nil && emailError == nil && cardIdError == nil
    }
    
    private func nameValidation() -> Void {
        nameError = nil
        
        name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let words = name.components(separatedBy: .whitespacesAndNewlines)
        let wordCount = words.filter { !$0.isEmpty }.count
        if wordCount < 2 {
            nameError = "Name should contain at least two words"
        }
        
        nameError = name.isEmpty ? "Name can't be empty" : nameError
    }
    
    private func emailValidation() -> Void {
        emailError = nil
        
        email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let containEmployeeDomain = companyModel.companyDomains.contains { companyDomain in
            email.range(of: companyDomain) != nil
        }
        emailError = !containEmployeeDomain ? "Email should contain company domain" : emailError
        
        emailError = email.rangeOfCharacter(from: .whitespaces) != nil ? "Email can't contain whitespaces" : emailError
        
        emailError = email.isEmpty ? "Email can't be empty" : emailError
    }
}
