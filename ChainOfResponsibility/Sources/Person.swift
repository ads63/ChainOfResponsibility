//
//  Person.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import Foundation

final class Person: Decodable {
    var name: String
    var age: Int
    var isDeveloper: Bool
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self,
                                         forKey: .name)
        self.age = try container.decode(Int.self,
                                        forKey: .age)
        self.isDeveloper = try container.decode(Bool.self,
                                                forKey: .isDeveloper)
    }

    enum CodingKeys: String, CodingKey {
        case name
        case age
        case isDeveloper
    }
}
