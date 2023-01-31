//
//  ImageModel.swift
//  SwiftUI+MVVM
//
//  Created by shraddha.sutar@accenture.com on 31/01/23.
//

import Foundation

struct ImageModel: Codable,Identifiable, Hashable {
    let id: String
    let author: String
    let downloadURL: String
    
    enum CodingKeys: String,CodingKey {
        case id, author
        case downloadURL = "download_url"
    }
}

