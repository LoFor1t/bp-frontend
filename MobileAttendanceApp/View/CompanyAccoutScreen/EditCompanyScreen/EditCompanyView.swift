//
//  EditCompanyView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 11/12/2024.
//

import SwiftUI

struct EditCompanyView: View {
    @StateObject var companyModel: CompanyModel
    
    var onEdit: (CompanyModel) -> Void
    
    var body: some View {
        VStack() {
            Text("New user")
                .font(.title2)
                .padding(.top, 30)
            
            // Name field
            InputTextFieldView(fieldName: "Company Name", placeholder: "Your company", errorMessage: companyModel.companyNameError, fieldValue: $companyModel.companyName)
                .padding(.horizontal)
                .padding(.bottom)
            
            // Company domain field
            InputTextFieldView(capitalizedSentences: false, fieldName: "Company Domain", placeholder: "@your.domain", errorMessage: companyModel.companyDomainsError, fieldValue: $companyModel.companyDomains.first!)
                .padding(.horizontal)
                .padding(.bottom)
            
            
            Spacer()
            
            Button(action: {
                if (companyModel.validate()) {
                    onEdit(companyModel)
                }
            }) {
                FullWidthButtonView(buttonText: "Save")
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    EditCompanyView(companyModel: CompanyModel(companyName: "LoFor1t corp", companyDomains: ["@example.com"], employees: [EmployeeModel(name: "employee 1"), EmployeeModel(name: "employee 2"), EmployeeModel(name: "employee 3"), EmployeeModel(name: "employee 4")]), onEdit: { companyModel in
        print("Company name: \(companyModel.companyName) Employees: \(companyModel.employees.map(\.name)) Domain: \(companyModel.companyDomains.first!)")
    })
}
