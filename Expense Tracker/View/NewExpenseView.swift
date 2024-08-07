//
//  NewExpenseView.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 07/08/24.
//

import SwiftUI

struct NewExpenseView: View {
    //View properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    
    //Random tint
    var tint: TintColor = tints.randomElement()!
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 15){
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                
                //Preview transaction card view
                TransactionCardView(transaction: .init(title: title.isEmpty ? "Title" : title, remarks: remarks.isEmpty ? "Remarks" : remarks, amount: amount, dateAdded: dateAdded, category: category, tintColor: tint))
             
                CustomSection("Title", "Magic Keyboard", value: $title)
                
                CustomSection("Remarks", "Apple Product!", value: $remarks)
                
                //Amount and category check box
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Amount & Category")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    HStack(spacing: 15){
                        TextField("0", value: $amount, formatter: numberFormatter)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background(.background, in: .rect(cornerRadius: 10))
                            .frame(maxWidth: 130)
                            .keyboardType(.decimalPad)
                        
                        //Custom checkbox
                        CategoryCheckBox()
                    }
                })
                
            }
            .padding(15)
        }
        .navigationTitle("Add Transaction")
        .background(.gray.opacity(0.15))
    }
    
    @ViewBuilder
    func CustomSection(_ title: String, _ hint: String, value: Binding<String>) -> some View{
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            TextField(hint, text: value)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
        })
    }
    
    //Custom checkbox
    @ViewBuilder
    func CategoryCheckBox() -> some View{
        HStack(spacing: 10){
            ForEach(Category.allCases, id: \.rawValue){ category in
                HStack(spacing: 5){
                    ZStack{
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(appTint)
                        
                        if self.category == category{
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(appTint)
                        }
                    }
                    Text(category.rawValue)
                        .font(.caption)
                    
                }
                .contentShape(.rect)
                .onTapGesture {
                    self.category = category
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .hSpacing(.leading)
        .background(.background, in: .rect(cornerRadius: 10))
    }
    
    //Number Formatter
    var numberFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    NavigationStack{
        NewExpenseView()
    }
}
