//
//  PostManager.swift
//  Morning Tech
//
//  Created by Krish Vijayan on 2023-02-25.
//

import Foundation

class PostManager: ObservableObject {
    
    @Published var posts = [Post]() //Whenever there is a change, notify the listeners
    
    
    var postURL = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fetchData(){
            //1. Create a URL
        if let url = URL(string: postURL) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url){ (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let postData = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = postData.hits //Array of all published posts
                            }
                        }catch {
                            print(error )
                        }
                    }
                }else{
                    
                }
            
            }
            //4. Start the task
            task.resume()
            
        }
    }
   
}
