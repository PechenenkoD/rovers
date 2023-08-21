//
//  RoversListView.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 17.08.2023.
//

import SwiftUI

struct RoversView: View {

    @StateObject private var viewModel = RoversViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.manifests, id: \.name) { manifest in
                    NavigationLink {
                        RoverManifestView(manifest: manifest)
                    } label: {
                        HStack {
                            Text("\(manifest.name)")
                                .foregroundColor(Color.orange)
                        }
                    }
                }
                if viewModel.manifests.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
                }
            }
            .navigationTitle("Available Rovers")
        }
        .task {
            await viewModel.fetchRovers()
        }
    }
}

struct RoversListView_Previews: PreviewProvider {
    static var previews: some View {
        RoversView()
    }
}
