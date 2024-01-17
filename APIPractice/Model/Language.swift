//
//  Language.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/18.
//

import Foundation

// MARK: - Language
struct Language: Codable {
    let message: Message
}

// MARK: - Message
struct Message: Codable {
    let type, service, version: String
    let result: Result

    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case service = "@service"
        case version = "@version"
        case result
    }
}

// MARK: - Result
struct Result: Codable {
    let srcLangType, tarLangType, translatedText, engineType: String
}
