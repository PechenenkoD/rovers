//
//  RoverManifestView.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 18.08.2023.
//

import SwiftUI

struct RoverManifestView: View {
    
    let manifest: PhotoManifest

    var body: some View {
        List(manifest.entries, id: \.sol) { entry in
            NavigationLink {
                RoverPhotoView(name: manifest.name, sol: entry.sol)
            } label: {
                HStack {
                    Text("Sol \(entry.sol) (\(Text.marsDateText(dateString: entry.earthDate)))")
                        .foregroundColor(Color.orange)
                }
            }
        }
        .navigationTitle(manifest.name)
    }
}

struct RoverManifestView_Previews: PreviewProvider {
    static var previews: some View {
        RoverManifestView(manifest:
            PhotoManifest(
                name: "",
                landingDate: "",
                launchDate: "",
                status: "",
                maxSol: 1,
                maxDate: "",
                totalPhotos: 1,
                entries: [
                    ManifestEntry(sol: 1, earthDate: "2022-01-01", totalPhotos: 0, cameras: []),
                    ManifestEntry(sol: 2, earthDate: "2022-01-02", totalPhotos: 30, cameras: []),
                    ManifestEntry(sol: 3, earthDate: "2022-01-03", totalPhotos: 300, cameras: [])
                ]
            )
        )
    }
}
