//
//  CompanyModel.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import Foundation

class CompanyModel: ObservableObject {
    var companyDomains: [String]
    
    init(companyDomains: [String]) {
        self.companyDomains = companyDomains
    }
}
