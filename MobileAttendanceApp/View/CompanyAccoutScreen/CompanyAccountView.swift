//
//  CompanyAccountView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct CompanyAccountView: View {
    @EnvironmentObject var companyModel: CompanyModel
    
    @State private var showNewEmployeeOverlay = false
    @State private var showEditEmployeeOverlay = false
    @State private var showEditCompanyOverlay = false
    
    @StateObject private var newEmployee = EmployeeModel()
    @State var editEmployeeName: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .foregroundStyle(.blue)
                            .padding(.leading, 70)
                        Spacer()
                        VStack(alignment: .leading) {
                            Button(action: {
                                showEditCompanyOverlay = true
                            }) {
                                Image(systemName: "pencil.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 150)
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    
                    Text("Count of employees: \(companyModel.employees.count)")
                        .font(.title2)
                        .padding(.top, 20)
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(companyModel.employees) { employee in
                            UserRowView(employeeName: employee.name, editUser: {
                                showEditEmployeeOverlay = true
                                editEmployeeName = employee.name
                            }, deleteUser: { employeeName in
                                companyModel.employees.removeAll(where: { $0.name == employeeName })
                            })
                        }
                    }
                }
                .navigationBarBackButtonHidden(showNewEmployeeOverlay || showEditEmployeeOverlay)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            withAnimation {
                                showNewEmployeeOverlay.toggle()
                            }
                        }) {
                            if !showNewEmployeeOverlay && !showEditEmployeeOverlay {
                                Text("Add new employee")
                            }
                        }
                    }
                }
                
                if showNewEmployeeOverlay {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showNewEmployeeOverlay.toggle()
                        }
                        .overlay {
                            EditUserView(employeeModel: newEmployee, buttonText: "Add Employee", companyDomains: companyModel.companyDomains, onEditUser: {newEmployee in
                                showNewEmployeeOverlay.toggle()
                                companyModel.employees.append(EmployeeModel(name: newEmployee.name, email: newEmployee.email, cardId: newEmployee.cardId))
                                self.newEmployee.resetAllFields()
                            })
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7)
                        }
                    
                }
                
                if showEditEmployeeOverlay {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showEditEmployeeOverlay.toggle()
                        }
                        .overlay {
                            EditUserView(employeeModel: companyModel.employees.first(where: {$0.name == editEmployeeName})!, buttonText: "Edit Employee", companyDomains: companyModel.companyDomains, onEditUser: {newEmployee in
                                showEditEmployeeOverlay.toggle()
                            })
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7)
                        }
                }
                
                if showEditCompanyOverlay {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showEditCompanyOverlay.toggle()
                        }
                        .overlay {
                            EditCompanyView(companyModel: companyModel.copy(), onEdit: { editedModel in
                                showEditCompanyOverlay.toggle()
                                companyModel.editFromModel(companyModel: editedModel)
                            })
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7)
                        }
                }
            }
        }
    }
}

#Preview {
    CompanyAccountView()
        .environmentObject(CompanyModel(companyName: "LoFor1t corp", companyDomains: ["@example.com"], employees: [EmployeeModel(name: "employee 1"), EmployeeModel(name: "employee 2"), EmployeeModel(name: "employee 3"), EmployeeModel(name: "employee 4")]))
}
