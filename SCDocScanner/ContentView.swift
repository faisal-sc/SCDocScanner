//
//  ContentView.swift
//  SCDocScanner
//
//  Created by Faisal-SC on 3/4/2025.
//

import SwiftUI

struct ContentView: View {
  
  @State private var scannedImages: [UIImage] = []
      @State private var isShowingSCDocumentScannerView = false

      var body: some View {
          NavigationView {
              Grid {
                  ForEach(scannedImages, id: \.self) { image in
                      VStack {
                          Image(uiImage: image)
                              .resizable()
                              .scaledToFit()
                              .frame(width: 100, height: 100)
                              .padding()
                      }
                  }
              }
              .sheet(isPresented: $isShowingSCDocumentScannerView) {
                SCDocumentScannerViewControllerRepresentable(scanResult: $scannedImages)
              }
              .toolbar {
                  ToolbarItem {
                      Button(action: showVNDocumentCameraView) {
                        Text("Scan Document")
                      }
                  }
              }
          }
      }

      private func showVNDocumentCameraView() {
          isShowingSCDocumentScannerView = true
      }
}

#Preview {
    ContentView()
}
