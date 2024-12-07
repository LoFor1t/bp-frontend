//
//  MainScreenView.swift
//  MobileAttendanceApp
//
//  Created by Vladyslav Hrieshnykh on 07/12/2024.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("user profile icon check")
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .padding(.leading, 20)
                })
                Spacer()
            }
            Spacer()
            
            Button(action: {
                print("tap to scan check")
            }) {
                Text("Tap to Scan")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.bottom, 80)
            }
            Spacer()
        }
    }
}

#Preview {
    MainScreenView()
}
