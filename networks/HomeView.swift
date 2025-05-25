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
        .onAppear() {
            
        }
    }
    
    func fetchNews() async {
        do{
            let articles = try await NetworkManager.shared.getNews()
            news = articles.articles
        }
        catch{
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}

#Preview {
    HomeView()
}
