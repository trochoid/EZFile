import UIKit

public class EZFile {
    
    //=============================================
    static private let fileName = "ezFile.xyz"
    //=============================================
    static private let allowWriting = true
    static private let allowReading = true
    //=============================================
    
    static private func getMyStaticFile() -> URL? { 
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return dir.appendingPathComponent(fileName)
        } else { return nil }
    }
    
    static private func getDataFromFile() -> Data? { 
        if !allowReading { return nil }
        do {
            return try Data(contentsOf: getMyStaticFile()!)
        } catch { print("error reading"); return nil }
    }
    
    static private func storeDataInFile(_ d: Data) {
        if !allowWriting { return }
        do {
            try d.write(to: getMyStaticFile()!)
        } catch { print("error writing.") }
    }
    
    static public func storeObject<T : Codable>(_ theObject: T) {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .base64
        do { 
            let d = try encoder.encode(theObject)
            storeDataInFile(d)
        } catch { print("storeObject failed") }
    }
    
    static public func retrieveObject<T>(_ type: T.Type) -> T? where T : Codable {
        guard let d = getDataFromFile() else { return nil }
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .base64
        do { 
            return try decoder.decode(type, from: d)
        } catch { 
            print("retrieveObject failed") 
            return nil
        }
    }
    
}
