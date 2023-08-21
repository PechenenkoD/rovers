//
//  MarsImageInfoView.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 17.08.2023.
//

import SwiftUI

struct MarsImageInfoView: View {
    
    let photo: Photo
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("Status: \(photo.rover.status)")
                Text.marsDateText(dateString: "Date: \(photo.earthDate)")
                Text("Rover: \(photo.rover.name)")
                Text("Camera: \(photo.camera.fullName) (\(photo.camera.name))")
            }
        }
        .padding(15)
        .hAlign(.leading)
        .font(.title3)
    }
}

struct MarsImageInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MarsImageInfoView(photo:
            Photo(
                id: 1,
                sol: 1,
                camera: Camera(name: "CMF", fullName: "Camera McLens Face"),
                imageSource: "https://example.com",
                earthDate: "2022-01-12",
                rover: PhotoRoverReference(
                    id: 1,
                    name: "IG-88",
                    landingDate: "2019-01-01",
                    launchDate: "2018-12-31",
                    status: "active"
                )
            )
        )
    }
}
