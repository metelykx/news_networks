//
//  ContentView.swift
//  networks
//
//  Created by Denis Ivaschenko on 24.05.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State var news: [Article] = []
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func fetchNews() async {
        do{
            let articles = try await NetworkManager.shared.getNews()
        }
        catch{
            
        }
    }
}

#Preview {
    HomeView()
}
