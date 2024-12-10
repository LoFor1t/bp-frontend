//
//  CompanyModel.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import Foundation

class CompanyModel: ObservableObject {
    var companyName: String
    var companyDomains: [String]
    var employees: [EmployeeModel]
    
    @Published var companyNameError: String?
    @Published var companyDomainsError: String?
    @Published var companyEmployeesError: String?
    
    init(companyName: String, companyDomains: [String], employees: [EmployeeModel]) {
        self.companyName = companyName
        self.companyDomains = companyDomains
        self.employees = employees
    }
    
    func validate() -> Bool {
        validateCompanyName()
        validateCompanyDomains()
        
        return companyNameError == nil && companyDomainsError == nil && companyEmployeesError == nil
    }
    
    func validateCompanyName() -> Void {
        companyNameError = nil
        
        companyNameError = companyName.isEmpty ? "Company name can't be empty" : nil
    }
    
    func validateCompanyDomains() -> Void {
        companyDomainsError = nil
        
        companyDomainsError = companyDomains.isEmpty ? "Company domains can't be empty" : nil
        
        if !companyDomains.isEmpty && !companyDomains[0].starts(with: "@") {
            companyDomainsError = "Company domains must start with @"
        }
    }
}
