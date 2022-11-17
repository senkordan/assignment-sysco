//
//  ApiError.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

enum AppError: Error {
    case general
    case noInternet
    case errorMessage(String)
}

extension AppError: LocalizedError {
    
    var description: String? {
        switch self {
        case .errorMessage(let message):
            return message
        case .noInternet:
            return L10n.noInternetMessage
        default:
            return L10n.generalErrorMessage
        }
    }
}
