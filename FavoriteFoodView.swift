//
//  FavoriteFoodView.swift
//  IndecisiveFood
//
//  Created by Oliver Davila on 9/22/24.
//

import SwiftUI

struct FavoriteFoodView: View {
    let selectedDiet: String
    let hasAllergies: Bool
    let allergyInfo: String
    
    // Sample food options for different diets and allergies
    let allergyFoods = ["Peanuts", "Shellfish", "Dairy"]
    var foodOptions: [String] {
        let allFoods: [String]
        
        switch selectedDiet {
        case "Vegetarian":
            allFoods = ["Salads", "Vegertarian Pizza", "Grilled Vegetables", "Fruit Salad"]
        case "Pescatarian":
            allFoods = ["Sushi", "Grilled Fish", "Shrimp Salad", "Seafood Pasta"]
        case "Vegan":
            allFoods = ["Vegan Burger", "Vegan Pizza", "Tofu Stir Fry", "Quinoa Salad"]
        default:
            allFoods = ["Pizza", "Sushi", "Burger", "Pasta", "Salad"]
        }
        
        print("All Food: \(allFoods)")
        
        if hasAllergies && allergyInfo.lowercased().contains("peanut") {
            let filteredFoods = allFoods.filter { !allergyFoods.contains($0) }
            print("Filtered Foods: \(filteredFoods)")
            return filteredFoods
        }
        return allFoods
    }
    
    @State private var selectedFoods = Set<String>()
    
    var body: some View {
        VStack {
            Text("Your diet is: \(selectedDiet)")
                .font(.headline)
                .padding(.top, 20)
            
            if hasAllergies {
                Text("Your allergies: \(allergyInfo)")
                    .font(.subheadline)
                    .foregroundStyle(.red)
                    .padding(.bottom, 10)
            }
            
            Text("Select your favorite types of food: ")
                .font(.title2)
                .padding(.top, 20)
            
            List(foodOptions, id: \.self) { food in
                MultipleSelectionRow(title: food, isSelected: selectedFoods.contains(food)) {
                    if selectedFoods.contains(food) {
                        selectedFoods.remove(food)
                    } else {
                        selectedFoods.insert(food)
                    }
                }
            }
            .frame(height: 300)
            
            Spacer()
            
            Text("You have selected \(selectedFoods.count) favorite food.")
                .font(.callout)
                .padding(.bottom, 10)
            
            if !selectedFoods.isEmpty {
                VStack(alignment: .leading) {
                    Text("Recommendations: ")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(Array(selectedFoods), id: \.self) { food in
                        Text("Try dishes related to \(food)")
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                }
                .padding()
            }
            
            Button(action: {
                print("Selected foods: \(selectedFoods)")
            }) {
                Text("Save Preferences")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Choose Favorite Foods")
    }
}

struct MultipleSelectionRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "fork.knife") // Food icon
                    .foregroundColor(.green)
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    FavoriteFoodView(selectedDiet: "Vegan", hasAllergies: true, allergyInfo: "Peanuts")
}
