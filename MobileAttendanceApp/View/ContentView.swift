//
//  ContentView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var companyModel = CompanyModel(companyName: "LoFor1t corp", companyDomains: ["@example.com"], employees: [EmployeeModel(name: "employee 1"), EmployeeModel(name: "employee 2"), EmployeeModel(name: "employee 3"), EmployeeModel(name: "employee 4")])
    
    var body: some View {
        MainScreenView()
            .environmentObject(companyModel)
    }
}

#Preview {
    ContentView()
}

