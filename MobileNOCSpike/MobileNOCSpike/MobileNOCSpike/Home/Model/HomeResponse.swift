//
//  HomeResponse.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation

struct HomeResponse: Codable {
    let content: [ServerResponse]
    let pageable: Pageable
    let totalPages, totalElements: Int
    let last, first: Bool
    let sort: Sort
    let numberOfElements, size, number: Int
    let empty: Bool
}

struct TargetMachine: Codable {
    let id, sourceMachineID: Int
    let targetMachine: ServerResponse
    let circuitStatusID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case sourceMachineID = "sourceMachineId"
        case targetMachine
        case circuitStatusID = "circuitStatusId"
    }
}

struct ServerResponse: Codable {
    var id: Int
    var name: String
    var ipAddress: String?
    var ipSubnetMask: String?
    var model: Model
    var locationID: Int
    var status: Status
    var type: TypeResponse
    var serialNumber, version: String?
    var communicationProtocols: [CommunicationProtocol]
    var targetMachines: [TargetMachine]
    var location: Int
    var serialNum: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, ipAddress, ipSubnetMask, model
        case locationID = "locationId"
        case status, type, serialNumber, version, communicationProtocols, targetMachines, location, serialNum
    }
}

struct CommunicationProtocol: Codable {
    let id: Int
    let name: String?
    let defaultPort: Int
}

struct Model: Codable {
    let id: Int
    let name: String
    let creationDate, expiryDate: String?
}

struct Status: Codable {
    let id: StatusID
    let statusValue, legacyValue: String
}
enum StatusID: Int, Codable{
    case green = 1
    case orange = 2
    case yellow = 3
    case red = 4
    case blue = 13
}
struct TypeResponse: Codable {
    let id: Int
    let name: String
}

struct Pageable: Codable {
    let sort: Sort
    let pageSize, pageNumber, offset: Int
    let unpaged, paged: Bool
}

struct Sort: Codable {
    let sorted, unsorted, empty: Bool
}

