//
//  MarsImageView.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 17.08.2023.
//

import SwiftUI

struct MarsImageView: View {
    
    let photo: Photo

    var body: some View {
        ZStack {
            VStack() {
                VStack {
                    AsyncImage(url: URL(string: photo.imageSource)) { phase in
                        switch phase {
                            case .empty:
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
                                    .vAlign(.center)
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                            case .failure(_):
                                VStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .foregroundColor(.orange)
                                }
                                .vAlign(.center)
                            default:
                                EmptyView()
                            }
                        }
                        Spacer()
                        MarsImageInfoView(photo: photo)
                    }
                    .background(Color.white)
                    .frame(height: 450)
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.06), radius: 20, x: 0, y: 6)
            }
            .padding(15)
        }
    }
}

struct MarsImageView_Previews: PreviewProvider {
  static var previews: some View {
    MarsImageView(photo: Photo(
      id: 1,
      sol: 1,
      camera: Camera(name: "CMF", fullName: "Camera McLens Face"),
      imageSource: "",
      earthDate: "",
      rover: PhotoRoverReference(
        id: 1,
        name: "",
        landingDate: "",
        launchDate: "",
        status: ""
        )
      )
    )
  }
}
