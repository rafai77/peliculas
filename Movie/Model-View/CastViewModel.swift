//
//  CastViewModel.swift
//  Movie
//
//  Created by Rafael Aguirre  on 28/10/20.
//

import Foundation


import Combine
import Alamofire
import SwiftyJSON


class CastViewModel: ObservableObject {
    @Published var cast = [Cast]()
    var req: String
    init(req : String)
    {
        //print(req)
        self.req = req
        self.getCast { (res, data) in
            self.cast = data
        }
    }
        
    public func getCast( completion:@escaping (_ res:Int ,_ data :[Cast]   )->Void)
    {
        var auxcast = [Cast]()
        DispatchQueue.main.async {
            AF.request(self.req).responseJSON   {  (response) in
                var result = -1
                switch response.result
                {
                case .success(let data):
                    
                    let json = JSON(data)
                    for i in json["cast"]
                    {
                        let c = Cast(id: i.1["id"].int ?? 0, character: i.1["character"].string ?? "0", name: i.1["name"].string ?? "0", profile_path: i.1["profile_path"].string ?? "0")
                        auxcast.append(c)
                    }
                  
                case .failure(let error):
                    result = -1
                    print(error,result)
                }
                completion(auxcast.count,auxcast)
            }
        }
    }
}

