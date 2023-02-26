//
//  ContentView.swift
//  Morning Tech
//
//  Created by Krish Vijayan on 2023-02-25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var postManager = PostManager() //Listener
    @State private var showWebView = false
    
    var body: some View {
        NavigationView{
            List(postManager.posts) {(post) in
                NavigationLink(destination: DetailView(url: post.url), label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                })
                .navigationTitle("Mornin' Tech")
            }
            .onAppear {
                self.postManager.fetchData()
            }
            .refreshable {
                self.postManager.fetchData()
                print("Refreshed Posts")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
}
