//
//  ApiError.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

enum AppError: Error {
    case general
    case remoteNotFound
    case errorMessage(String)
}

extension AppError: LocalizedError {
    
    var description: String? {
        switch self {
        case .errorMessage(let message):
            return message
        case .remoteNotFound:
            return L10n.remoteNotFound
        default:
            return L10n.generalErrorMessage
        }
    }
}
