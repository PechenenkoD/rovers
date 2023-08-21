//
//  MainModel.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 17.08.2023.
//

import SwiftUI

struct RoversContainer: Codable {
    let rovers: [Rover]
}

struct Rover: Codable, Identifiable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    let maxSol: Int
    let maxDate: String
    let totalPhotos: Int
    let cameras: [Camera]

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

struct Camera: Codable {
    let name: String
    let fullName: String

    private enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

struct LatestPhotos: Codable {
    let photos: [Photo]

    private enum CodingKeys: String, CodingKey {
        case photos = "latest_photos"
    }
}

struct Photo: Codable, Identifiable {
    let id: Int
    let sol: Int
    let camera: Camera
    let imageSource: String
    let earthDate: String
    let rover: PhotoRoverReference

    private enum CodingKeys: String, CodingKey {
        case id
        case sol
        case camera
        case imageSource = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

struct PhotoRoverReference: Codable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

struct PhotoManifestContainer: Codable {
    let photoManifest: PhotoManifest

    private enum CodingKeys: String, CodingKey {
        case photoManifest = "photo_manifest"
    }
}

struct PhotoManifest: Codable {
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    let maxSol: Int
    let maxDate: String
    let totalPhotos: Int
    let entries: [ManifestEntry]

    private enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case entries = "photos"
    }
}

struct ManifestEntry: Codable {
    let sol: Int
    let earthDate: String
    let totalPhotos: Int
    let cameras: [String]

    private enum CodingKeys: String, CodingKey {
        case sol
        case earthDate = "earth_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

struct PhotosContainer: Codable {
    let photos: [Photo]

    private enum CodingKeys: String, CodingKey {
        case photos
    }
}
