//
//  RoversViewModel.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 21.08.2023.
//

import Foundation

class RoversViewModel: ObservableObject {
    
    let marsData = MainData()
    @Published var manifests: [PhotoManifest] = []
    
    func fetchRovers() async {
        manifests = []
        do {
            manifests = try await marsData.fetchPhotoManifests()
        } catch {
            log.error("Error fetching rover manifests: \(String(describing: error))")
        }
    }
    
}
