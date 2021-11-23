//
//  ContentView.swift
//  SwingOn by EC463 Team 20
//  Created on 10/29/21.
//

import SwiftUI
import PhotosUI
import MapKit
import AVKit

struct ContentView: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State private var isShowingConfirmation = false
    @State private var isShowingPhotoPickerModel = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .disabled(true)
                    .ignoresSafeArea(.container, edges: .top)
                    .accentColor(Color(.systemBlue))
                    .onAppear {
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                
                Spacer()
                
                Button {
                    isShowingConfirmation = true
                } label: {
                    Text("Let's start here")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.blue)
                .cornerRadius(13)
                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                .padding()
                .confirmationDialog("Start uploading your videos", isPresented: $isShowingConfirmation, titleVisibility: .visible) {
                    Button("Open Camera", action: {})
                    Button("Upload from Photos", action: {
                        isShowingPhotoPickerModel = true
                    })
                    Button("Upload from Files", action: {})
                }
                
                Spacer()
                
            }
            .navigationTitle("Welcome")
            .sheet(isPresented: $isShowingPhotoPickerModel, content: {
                PhotoPickerModel()
            })
            
        }
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            
        }
    }
}