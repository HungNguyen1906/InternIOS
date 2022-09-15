//
//  Landmark.swift
//  Landmarks
//
//  Created by MaxMobile on 15/09/2022.
//

//import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable { // Khi su dung giao thuc Identifiable, ta co the lam cho du lieu cua minh co the nhan dang duoc, nen ta khong can su dung id: \.id
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
         var latitude: Double
         var longitude: Double
     }
}
