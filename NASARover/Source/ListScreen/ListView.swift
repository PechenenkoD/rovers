//
//  ListView.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 17.08.2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject private var viewModel = ListViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack() {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(viewModel.latestPhotos) { photo in
                            MarsImageView(photo: photo)
                        }
                    }
                }
                if viewModel.latestPhotos.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
                }
            }
            .navigationTitle("List Photos")
        }
        .task {
            await viewModel.fetchLatestPhotos()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
