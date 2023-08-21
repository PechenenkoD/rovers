//
//  RoverPhotoViewModel.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 21.08.2023.
//

import Foundation

class RoverPhotoViewModel: ObservableObject {
   
    private let marsData = MainData()
    @Published var photos: [Photo] = []
    
    func fetchRoverPhoto(roverName: String, sol: Int) async {
        photos = await marsData.fetchPhotos(roverName: roverName, sol: sol)
    }
    
}
