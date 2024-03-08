//
//  NetworkErrors.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import Foundation

/// Type of errors we may encounter while trying to query the API.
enum NetworkErrors: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "An error occurred while trying to query the API: status code"
    case jsonDecoder = "Error trying to extract data from JSON."
    case unauthorized
}
