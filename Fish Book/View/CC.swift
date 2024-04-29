//
//  CC.swift
//  Fish Book
//
//  Created by mostafa on 23/04/2024.
//

import SwiftUI

import SwiftUI

struct CC: View {
    @State private var selectedImage: UIImage?
    @State private var imageURL: String?
    @State private var showAlert = false
    @State private var isShowingImagePicker = false
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""


    func uploadImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to JPEG data")
            return
        }

        guard let url = URL(string: "http://localhost:8080/api/image/uploadUserImage") else {
            print("Invalid URL for image upload")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        
        // Append image data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        
        // Append end boundary
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                print("HTTP Error: \(httpResponse.statusCode)")
                return
            }
            
            if let responseData = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: responseData)
                    print("Image URL: \(decodedResponse.url)")
                    // Handle success
                } catch {
                    print("Error decoding response: \(error)")
                }
            } else {
                print("No response data")
            }
        }
        
        task.resume()
    }

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } else {
                Text("Select an image")
            }

            Button("Choose Image") {
                isShowingImagePicker = true
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
            .padding()

            Button("Upload Image") {
                uploadImage(image: selectedImage! )

            }
            .padding()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Failed to upload image"), dismissButton: .default(Text("OK")))
        }
    }
}

extension CC {
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CC

        init(_ parent: CC) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            picker.dismiss(animated: true, completion: nil)
        }
    }
}

struct CC_Previews: PreviewProvider {
    static var previews: some View {
        CC()
    }
}

