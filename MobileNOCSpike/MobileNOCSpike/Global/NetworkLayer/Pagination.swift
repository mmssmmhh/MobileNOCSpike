//
//  Pagination.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import Foundation

struct Pagination: Decodable {
    
    var pagination: PaginationData
    
    struct PaginationData: Decodable {
        var total: Int
        var count: Int
        var per_page: Int
        var current_page: Int
        var total_pages: Int
    }
    
}

