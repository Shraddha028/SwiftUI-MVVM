//
//  ContentView.swift
//  SwiftUI+MVVM
//
//  Created by shraddha.sutar@accenture.com on 31/01/23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var imageViewModel: ImageViewModel
    var body: some View {
        NavigationView {
            List(imageViewModel.model, id: \.self) { imageObj in
                NavigationLink(destination: PictureView(isFullSize: true, url: imageObj.downloadURL)) {
                    VStack {
                    Text(imageObj.author)
                    PictureView(isFullSize: false, url: imageObj.downloadURL)
                    }
                }
            }
            .onAppear(perform: {
                imageViewModel.getDataFromAPI()
            })
        }.navigationTitle("Gallery")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(imageViewModel: ImageViewModel())
    }
}

struct PictureView: View {
    var isFullSize: Bool
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable().aspectRatio(contentMode: isFullSize ? .fill : .fit).cornerRadius(20).shadow(radius: 3)
            case .failure:
                Image(systemName: "Photo")
            default:
                EmptyView()
            }
        }
    }
}
