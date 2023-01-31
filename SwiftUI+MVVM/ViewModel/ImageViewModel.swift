//
//  ImageViewModel.swift
//  SwiftUI+MVVM
//
//  Created by shraddha.sutar@accenture.com on 31/01/23.
//

import Foundation
import SwiftUI


class ImageViewModel: ObservableObject {
    
    @Published var model = [ImageModel]()
    
    func getDataFromAPI() {
        
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, resposne, error in
               
                let jsonData = try? JSONDecoder().decode([ImageModel].self, from: data!)
            
                DispatchQueue.main.async {
                    if let imageModel = jsonData {
                        self.model = imageModel
                    }
                }
        }.resume()
        
    }
    
}
