//
//  RoverPhotosBySolListView.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 18.08.2023.
//

import SwiftUI

struct RoverPhotoView: View {
    
    let name: String
    let sol: Int
    
    @StateObject private var viewModel = RoverPhotoViewModel()

    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.photos) { photo in
                        MarsImageView(photo: photo)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                    }
                }
            }
            if viewModel.photos.isEmpty {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
            }
        }
        .navigationTitle(name)
        .task(id: "fun", priority: .medium) { }
        .task {
            await viewModel.fetchRoverPhoto(roverName: name, sol: sol)
        }
    }
}

struct RoverPhotosBySolListView_Previews: PreviewProvider {
    static var previews: some View {
        RoverPhotoView(name: "Spirit", sol: 1)
    }
}
