//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 08/03/22.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    private init() {}
    
    private func createFolderIfNeeded(folderName: String) {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName).path else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating folder: \(error)")
            }
        }
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        guard let data = image.pngData(),
              let pathURL = getImagePath(imageName: imageName, folderName: folderName)
        else { return }
        
        do {
            try data.write(to: pathURL)
            //print("Path ------->", pathURL)
            //print("Success Saving!")
        } catch let error {
            print("Error: \(error.localizedDescription)")
            //print("Error saving image \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let path = getImagePath(imageName: imageName, folderName: folderName)?.path,
        FileManager.default.fileExists(atPath: path) else {
            //print("Error getting path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    
    private func getImagePath(imageName: String, folderName: String) -> URL? {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName).appendingPathComponent("\(imageName).png") else {
            //print("Error getting path.")
            return nil
        }
        return path
    }
}
