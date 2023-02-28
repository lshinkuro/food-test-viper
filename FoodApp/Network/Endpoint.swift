//
//  Endpoint.swift
//  FoodApp
//
//  Created by Macbook on 25/02/23.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift


enum Endpoint {
    case fetchFood
    case fetchStarships(param: String)
    
    func path() -> String {
        switch self {
        case .fetchFood:
            return "/movie/popular"
        case .fetchStarships:
            return "/fetchStarship"
        }
    }
    
    func method() -> HTTPMethod {
        switch self {
        case .fetchFood:
            return .get
        default:
            return .post
        }
    }
    
    var parameters: [String: Any]? {

      switch self {
      case .fetchFood:
          let params: [String: Any] = [
              "api_key": BaseConstant.apiKey,
              "language": "en-US",
              "page": 1
          ]
          return params          
      case .fetchStarships(let params):
        let params: [String: Any] = [
          "user_id": params
        ]
        return params
      }
    }

    var headers: HTTPHeaders {
      switch self {
      case .fetchFood,
          .fetchStarships:
        let params: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        return params
      }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .fetchFood,
            .fetchStarships:
            return URLEncoding.queryString
  //      default:
  //          return JSONEncoding.default
        }
    }

    func urlString() -> String {
      return BaseConstant.baseUrl + self.path()
    }
    
}


struct BaseConstant {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let imageURL = "https://www.themoviedb.org/t/p/w440_and_h660_face"
    
    static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZTUyMGFhNjBhMGI0N2I5YTdmNzYyNzVkZWMwY2ViMyIsInN1YiI6IjYzZDcxNDY5MTdjNDQzMDA3ZTc2MWQ0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HFiXzpM2eHC_q4F_XUqHKtpOXCJ2_eKuglb15rfAg4Y"
    
    static let apiKey = "9e520aa60a0b47b9a7f76275dec0ceb3"
}
