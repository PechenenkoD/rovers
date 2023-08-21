//
//  MainData.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 17.08.2023.
//

import SwiftUI
import OSLog
import SDWebImage

class MainData {
    let mainRoverAPI = MainRoverAPI()

    func fetchAllRovers() async -> [Rover] {
        do {
            return try await mainRoverAPI.allRovers()
        } catch {
            log.error("Error: \(String(describing: error))")
            return []
        }
    }

    func fetchLatestPhotos() async -> [Photo] {
        await withTaskGroup(of: Photo?.self) { group in
            let rovers = await fetchAllRovers()

            for rover in rovers {
                group.addTask {
                    let photos = try? await self.mainRoverAPI.latestPhotos(rover: rover)
                    return photos?.first
                }
            }

            var latestPhotos: [Photo] = []
            for await result in group {
                if let photo = result {
                    latestPhotos.append(photo)
                }
            }
            return latestPhotos
        }
    }

    func fetchPhotoManifests() async throws -> [PhotoManifest] {
        let api = mainRoverAPI

        return try await withThrowingTaskGroup(of: PhotoManifest.self) { group in
            let rovers = await fetchAllRovers()

            try Task.checkCancellation()
            for rover in rovers {
                group.addTask {
                    return try await api.photoManifest(rover: rover)
                }
            }

            return try await group.reduce(into: []) { manifestArray, manifest in
                manifestArray.append(manifest)
            }
        }
    }

    func fetchPhotos(roverName: String, sol: Int) async -> [Photo] {
        do {
            return try await mainRoverAPI.photos(roverName: roverName, sol: sol)
        } catch {
            log.error("Error: \(String(describing: error))")
            return []
        }
    }
}
