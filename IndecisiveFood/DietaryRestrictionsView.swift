//
//  DietaryRescrictionsView.swift
//  IndecisiveFood
//
//  Created by Oliver Davila on 9/8/24.
//

import Foundation
import SwiftUI

struct DietaryRestrictionsView: View {
    @State private var selectedDiet = "None"
    @State private var hasAllergies = false
    @State private var allergyInfo = ""
    
    let dietOptions = ["None", "Vegetarian", "Pescatarian", "Vegan"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select your diet")) {
                    Picker("Diet Type", selection: $selectedDiet) {
                        ForEach(dietOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Do you have any allergies?")) {
                    Toggle(isOn: $hasAllergies) {
                        Text(hasAllergies ? "Yes" : "No")
                    }
                    
                    if hasAllergies {
                        TextField("Please specify your allergies", text: $allergyInfo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                Section {
                    Text("Diet: \(selectedDiet)")
                    Text("Allergies \(hasAllergies ? "Yes" : "No")")
                    
                    if hasAllergies && !allergyInfo.isEmpty {
                        Text("Specific Allergy: \(allergyInfo)")
                    }
                }
                
                Section {
                    NavigationLink(destination: FavoriteFoodView(selectedDiet: selectedDiet, hasAllergies: hasAllergies, allergyInfo: allergyInfo)) {
                            Text("Next")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Dietary Restrictions")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    DietaryRestrictionsView()
}
