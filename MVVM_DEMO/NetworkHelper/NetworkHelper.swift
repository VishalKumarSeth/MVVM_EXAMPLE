//
//  NetworkHelper.swift
//  MVVM_DEMO
//
//  Created by Vishal Kumar on 18/12/22.
//

import Foundation

enum Result<Value:Codable> {
    case success(Value)
    case failure(Bool)
}

typealias callBack = (Result<Data>) -> Void

struct NetworkURL {
    static let kGetData = "https://api.github.com/users?since=0&per_page=20"
}

class NetworkHelper {
    static let sharedInstance = NetworkHelper.init()
    private init() {}
    
    func fetchLoginData(callback: @escaping callBack) {
        let networkUrl:URL = URL(string: NetworkURL.kGetData)!
        var request:URLRequest = URLRequest.init(url: networkUrl)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { responseData, urlResponse, error in
            if error == nil {
                DispatchQueue.main.async {
                    if responseData != nil {
                        callback(.success(responseData!))
                    } else {
                        callback(.failure(true))
                    }
                }
            } else {
                print(error.debugDescription)
            }
        }.resume()        
    }
}
