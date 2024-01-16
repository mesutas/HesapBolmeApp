//
//  ContentView.swift
//  HesapBol
//
//  Created by asdirector on 16.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercenTage = 2
    
    let tipPercenTages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercenTages[tipPercenTage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Tutar Miktarı Girin..",text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Kişi Sayısı Seçin", selection: $numberOfPeople){
                        ForEach(2 ..< 7){
                            Text("\($0) Kişi")
                                                    }
                    } .pickerStyle(.segmented)
                    
                    
                    Picker("Daha Fazla Kişi Seçin", selection: $numberOfPeople){
                        ForEach(2 ..< 51){
                            Text("\($0) Kişi")
                        }
                    }
                    
          
                    
                }
                
                Section{
                   
                    Picker("Bahşiş Oranı Seçin..", selection: $tipPercenTage) {
                        ForEach(0 ..< tipPercenTages.count){
                            Text("\(self.tipPercenTages[$0])%")
                            
                        }
                    }.pickerStyle(.segmented)
                        
                    
                } header:{
                    Text("NE KADAR BAHŞİŞ BIRAKMAK İSTİYORSUNUZ?")
                }
                
                Section {
                    Text("₺\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section{
                    Text("Uygulamamızı tercih ettiğiniz için teşekkür ederiz (:")
                    Text("@mesutasdeveloper")
                        .font(.subheadline)
                        
                        
                }
            }
            .navigationTitle("HESABI BÖLÜŞTÜRÜN")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
