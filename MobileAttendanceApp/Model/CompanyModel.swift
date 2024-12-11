//
//  CompanyModel.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import Foundation

class CompanyModel: ObservableObject {
    @Published var companyName: String
    @Published var companyDomains: [String]
    @Published var employees: [EmployeeModel]
    
    @Published var companyNameError: String?
    @Published var companyDomainsError: String?
    @Published var companyEmployeesError: String?
    
    init(companyName: String, companyDomains: [String], employees: [EmployeeModel]) {
        self.companyName = companyName
        self.companyDomains = companyDomains
        self.employees = employees
    }
    
    func editFromModel(companyModel: CompanyModel) {
        self.companyName = companyModel.companyName
        self.companyDomains = companyModel.companyDomains
        self.employees = companyModel.employees
    }
    
    func copy() -> CompanyModel {
        CompanyModel(companyName: companyName, companyDomains: companyDomains, employees: employees)
    }
    
    func validate() -> Bool {
        validateCompanyName()
        validateCompanyDomains()
        
        return companyNameError == nil && companyDomainsError == nil && companyEmployeesError == nil
    }
    
    private func validateCompanyName() -> Void {
        companyNameError = nil
        
        companyNameError = companyName.isEmpty ? "Company name can't be empty" : nil
    }
    
    private func validateCompanyDomains() -> Void {
        companyDomainsError = nil
        
        companyDomainsError = companyDomains.isEmpty ? "Company domains can't be empty" : nil
        
        if !companyDomains.isEmpty && !companyDomains[0].starts(with: "@") {
            companyDomainsError = "Company domains must start with @"
        }
    }
}
