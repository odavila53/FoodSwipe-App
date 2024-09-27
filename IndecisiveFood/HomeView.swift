//
//  HomeView.swift
//  IndecisiveFood
//
//  Created by Oliver Davila on 9/8/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("Welcome to FoodApp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
                }) {
                    Text("Create Account")
                        .font(.headline)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }.padding(.horizontal)
                
                
                NavigationLink(destination: DietaryRestrictionsView()) {
                    Text("Continue as a Guest")
                        .font(.headline)
                        .background(Color.gray)
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
