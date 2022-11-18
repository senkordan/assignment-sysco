//
//  TestUtils.swift
//  AssignmentTests
//
//  Created by Senkordan Satchithananthan on 2022-11-18.
//

import Foundation
@testable import Assignment

class TestUtils {
    
    static func loadBundleUrl(resourceName: String, andExtension fileExtension: String, classType: AnyClass) -> URL? {
        let testBundle = Bundle(for: classType)
        return testBundle.url(forResource: resourceName, withExtension: fileExtension)
    }
    
    static func stubbedResponse<Response: Decodable>(responseJsonFileName: String,
                                                     responseClass: Response.Type,
                                                     classType: AnyClass) -> Response? {
        let decoder = JSONDecoder()
        
        guard let url = loadBundleUrl(resourceName: responseJsonFileName, andExtension: "json", classType: classType),
            let data = try? Data(contentsOf: url),
            let decodedResponse = try? decoder.decode(Response.self, from: data) else {
                return nil
        }
        return decodedResponse
    }
}
