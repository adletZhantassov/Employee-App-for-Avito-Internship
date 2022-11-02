//
//  Webservice.swift
//  Employee-App-Avito Internship
//
//  Created by Adlet Zhantassov on 02.11.2022.
//

import Foundation

public final class Webservice {
    
    static let shared = Webservice()
    private let avito_url = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    private let dataCache = NSCache<NSString, MainModel>()
    private let cacheOneHour: TimeInterval = 60 * 60
    public static var error: Error? = nil
    
    public init() {}
    
    public func parse(jsonData: Data) -> Model? {
        do {
            let decodedData = try JSONDecoder().decode(Model.self, from: jsonData)
            return decodedData
        } catch {
            Webservice.error = error
        }
        return nil
    }
    
    public func fetchData(completion: @escaping (Model) -> Void) {
        if let mainModel = dataCache.object(forKey: "cache data") {
            print("data cache exist")
            guard Date.init() < mainModel.expiration else {
                dataCache.removeObject(forKey: "cache data")
                return
            }
            print("using data from cache")
            completion(mainModel.mainModelObj)
            return
        }
        
        guard let url = URL(string: avito_url) else { return }
        
        print("Fetching data, not from cache")
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error == nil && data != nil {
                    if let temporaryModel = self.parse(jsonData: data!) {
                        let date = Date.init().addingTimeInterval(self.cacheOneHour)
                        let mainModelObj = MainModel(Model: temporaryModel, expiration: date)
                        self.dataCache.setObject(mainModelObj, forKey: "cache data")
                        completion(temporaryModel)
                    }
                }
                else if error != nil {
                    Webservice.error = error
                }
            }
        }
        dataTask.resume()
    }
}
