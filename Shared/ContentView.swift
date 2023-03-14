//
//  ContentView.swift
//  Shared
//
//  Created by Alex Patterson on 3/14/23.
//

import SwiftUI
import Appwrite

let client = Client()
    .setEndpoint("https://demo.appwrite.io/v1")
    .setProject("6062f9c2c09ce")
let locale = Locale(client);

struct ContentView: View {
    @State private var countries: [AppwriteModels.Country] = [];
    var body: some View {
        ZStack {
            List{
                ForEach(self.countries, id: \.code){country in
                    Text("\(country.name)")
                }
            }
        }
        VStack {
            Button(action: {
                Task {
                    self.countries = try await locale.listCountries().countries
                }
                }) {
                Text("Get Countries")
            }
            Button(action: {
                Task {
                    self.countries.removeAll()
                }
                }) {
                Text("Remove")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
