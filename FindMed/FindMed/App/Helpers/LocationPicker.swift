//
// View+App.swift
// FindMed
//
// Created by Mohamed Bilal on 03/05/25
//

import SwiftUI
import CoreLocation
import MapKit

extension View {
    func locationPicker(isPresented: Binding<Bool>, coordinates: @escaping (CLLocationCoordinate2D?) -> ()) -> some View {
        self
            .fullScreenCover(isPresented: isPresented) {
                LocationPickerView(isPresented: isPresented, coordinates: coordinates)
            }
    }
}

fileprivate struct LocationPickerView: View {
    @Binding var isPresented: Bool
    var coordinates: (CLLocationCoordinate2D?) -> ()
    
    /// View Properties
    @StateObject private var manager: LocationManager = .init()
    
    var body: some View {
        ZStack {
            if let isPermissionDenied = manager.isPermissionDenied {
                
            } else {
                Group {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                    
                    ProgressView()
                }
            }
        }
        .onAppear(perform: manager.requestUserLocation)
    }
    
    @ViewBuilder
    func NoPermissionView() -> some View {
        VStack {
            HStack {
                // https://youtu.be/U2kBmasBSTA?feature=shared&t=459
            }
        }
    }
}

/// Observable object for Location Manager
fileprivate class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var isPermissionDenied: Bool?
    
    /// Map Properties
    @Published var currentRegion: MKCoordinateRegion?
    @Published var position: MapCameraPosition = .automatic
    @Published var userCoordinates: CLLocationCoordinate2D?
    
    private var manager: CLLocationManager = .init()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    /// Delegate methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        guard status != .notDetermined else { return }
        
        isPermissionDenied = (status == .denied)
        
        if status != .denied {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinates = locations.first?.coordinate else { return }
        
        userCoordinates = coordinates
        let region = MKCoordinateRegion(
            center: coordinates,
            latitudinalMeters: coordinates.latitude,
            longitudinalMeters: coordinates.longitude
        )
        position = .region(region)
        
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        /// Handle errors
    }
    
    /// Additional Helpers
    func requestUserLocation() {
        manager.requestWhenInUseAuthorization()
    }
}
