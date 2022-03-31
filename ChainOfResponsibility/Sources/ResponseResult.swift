//
//  ResponseResult.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import Foundation

class ResponseResult: ResponseProtocol {
    var list: [Person]?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.decode([Person].self, forKey: .result)
    }

    enum CodingKeys: String, CodingKey {
        case result
    }
}
