//
//  APIResults.swift
//  SimpleCreation
//
//  Created by Erum on 20/12/21.
//

import Foundation
struct APIResults<T: Decodable>: Decodable {
    
    let statusCode: String?
    let value: T
    
    private enum CodingKeys: String, CodingKey {
        case statusCode, value = "data"
    }
}

struct ErrorModel: Decodable {
    
    let statusCode: String?
    let errorMessage: String
    
    private enum CodingKeys: String, CodingKey {
        case statusCode, errorMessage
    }
}



public protocol JSONType: Codable {
    var jsonValue: Any { get }
}
extension Int: JSONType {
    public var jsonValue: Any { return self }
}
extension String: JSONType {
    public var jsonValue: Any { return self }
}
extension Double: JSONType {
    public var jsonValue: Any { return self }
}
extension Bool: JSONType {
    public var jsonValue: Any { return self }
}

public struct AnyJSONType: JSONType {
    public let jsonValue: Any
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let intValue = try? container.decode(Int.self) {
            jsonValue = intValue
        } else if let stringValue = try? container.decode(String.self) {
            jsonValue = stringValue
        } else if let boolValue = try? container.decode(Bool.self) {
            jsonValue = boolValue
        } else if let doubleValue = try? container.decode(Double.self) {
            jsonValue = doubleValue
        } else if let doubleValue = try? container.decode(Array<AnyJSONType>.self) {
            jsonValue = doubleValue
        } else if let doubleValue = try? container.decode(Dictionary<String, AnyJSONType>.self) {
            jsonValue = doubleValue
        } else {
            jsonValue = container.decodeNil()
            //throw DecodingError.typeMismatch(JSONType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unsupported JSON type"))
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let intValue = jsonValue as? Int {
            try container.encode(intValue)
        } else if let stringValue = jsonValue as? String {
            try container.encode(stringValue)
        } else if let boolValue = jsonValue as? Bool {
            try container.encode(boolValue)
        } else if let doubleValue = jsonValue as? Double {
            try container.encode(doubleValue)
        } else if let arraayValue = jsonValue as? Array<AnyJSONType> {
            try container.encode(arraayValue)
        } else if let dictValue = jsonValue as? Dictionary<String, AnyJSONType> {
            try container.encode(dictValue)
        } else {
            throw EncodingError.invalidValue(jsonValue, .init(codingPath: encoder.codingPath, debugDescription: "Unsupported JSON type"))
        }
    }
    
}

extension AnyJSONType {
    var mapValue: Any {
        if let v = jsonValue as? Dictionary<String, AnyJSONType> {
            return Dictionary(uniqueKeysWithValues: v.map { key, value in (key, value.mapValue) })
        } else if let v = jsonValue as? Array<AnyJSONType> {
            return v.map({ $0.mapValue })
        } else {
            return jsonValue
        }
    }
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
