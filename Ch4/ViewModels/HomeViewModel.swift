//
//  HomeViewModel.swift
//  Ch4-Sawt
//
//  Created by Fatimah Alqarni on 15/06/1446 AH.
//

import SwiftUI
import Vision

/// ViewModel for managing the state and logic of HomeView
class HomeViewModel: ObservableObject {
    @Published var showMenu = false
    @Published var showPhotoPicker = false
    @Published var showCamera = false
    @Published var selectedImage: UIImage? = nil
    @Published var recognizedText: String = ""
    @Published var showResultView = false

    /// Extracts text from the selected image using Vision framework
    func extractTextFromImage() {
        guard let image = selectedImage, let cgImage = image.cgImage else {
            print("Image not found.")
            return
        }

        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest { [weak self] (request, error) in
            if let error = error {
                print("Error recognizing text: \(error)")
                return
            }
            if let observations = request.results as? [VNRecognizedTextObservation] {
                DispatchQueue.main.async {
                    self?.recognizedText = observations.compactMap {
                        $0.topCandidates(1).first?.string
                    }.joined(separator: "\n")
                    self?.showResultView = true
                }
            }
        }

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.recognitionLanguages = ["ar"]

        do {
            try requestHandler.perform([request])
        } catch {
            print("Error performing text recognition: \(error)")
        }
    }
}
