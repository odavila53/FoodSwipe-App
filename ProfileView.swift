//
//  ProfileView.swift
//  IndecisiveFood
//
//  Created by Oliver Davila on 9/22/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var selectedDiet = ""
    @State private var hasAllergies = false
    @State private var allergyInfo = ""
    @State private var favoriteFoods = Set<String>()
    
    let dietOptions = ["None", "Vegetarian", "Pescatarian", "Vegan"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Name", text: $username)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                Section(header: Text("Dietary Preferences")) {
                    Picker("Diet Type")
                }
            }
        }
    }

    
#Preview {
    ProfileView()
}
