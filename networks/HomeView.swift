//
//  ContentView.swift
//  networks
//
//  Created by Denis Ivaschenko on 24.05.2025.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Properties
    @State var news: [Article] = []
    
    //MARK: -Body
    var body: some View {
        VStack {
            
            ForEach(news, id: \.url) { article in
                Text(article.title)
            }
        }
        .onAppear() {
            Task {
                await fetchNews()
            }
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
