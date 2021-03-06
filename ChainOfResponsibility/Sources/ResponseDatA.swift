//
//  ResponseData.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import Foundation

class ResponseData: ResponseProtocol {
    var list: [Person]?

    public required init(from decoder: Decoder) {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self)
        else { return }
        self.list = try? container.decode([Person].self, forKey: .data)
    }

    enum CodingKeys: String, CodingKey {
        case data
    }
}
