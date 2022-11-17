//
//  ErrorExtension.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

extension Error {
    
    func parse() -> String {
        let appError = self as? AppError
        return appError?.errorDescription ?? L10n.generalErrorMessage
    }
    
}
