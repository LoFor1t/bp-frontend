//
//  UserModel.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import Foundation

class EmployeeModel: ObservableObject, Identifiable {
    @Published var name: String
    @Published var email: String
    @Published var cardId: String
    
    @Published var nameError: String?
    @Published var emailError: String?
    @Published var cardIdError: String?
    
    init(name: String = "", email: String = "", cardId: String = "") {
        self.name = name
        self.email = email
        self.cardId = cardId
    }
    
    func resetAllFields() {
        self.name = ""
        self.email = ""
        self.cardId = ""
        
        nameError = nil
        emailError = nil
        cardIdError = nil
    }
    
    func validate(companyDomains: [String]) -> Bool {
        nameValidation()
        emailValidation(companyDomains: companyDomains)
        cardIdValidation()
        
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
    
    private func emailValidation(companyDomains: [String]) -> Void {
        emailError = nil
        
        email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let containEmployeeDomain = companyDomains.contains { companyDomain in
            email.range(of: companyDomain) != nil
        }
        emailError = !containEmployeeDomain ? "Email should contain company domain" : emailError
        
        emailError = email.rangeOfCharacter(from: .whitespaces) != nil ? "Email can't contain whitespaces" : emailError
        
        emailError = email.isEmpty ? "Email can't be empty" : emailError
    }
    
    private func cardIdValidation() -> Void {
        cardIdError = nil
        
        cardIdError = cardId.isEmpty ? "Card ID can't be empty" : cardIdError
    }
}
