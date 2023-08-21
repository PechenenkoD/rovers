//
//  ListViewModel.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 21.08.2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    private let marsData = MainData()
    @Published var latestPhotos: [Photo] = []
    
    func fetchLatestPhotos() async {
        latestPhotos = await marsData.fetchLatestPhotos()
    }
    
}
