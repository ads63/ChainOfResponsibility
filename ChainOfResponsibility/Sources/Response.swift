//
//  Response.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//
import Foundation

class Response: ResponseProtocol {
    var list: [Person]?

    required init(from decoder: Decoder) {
        var personArray = [Person]()
        guard var container = try? decoder.unkeyedContainer() else { return }
        while !container.isAtEnd {
            if let person = try? container.decode(Person.self) {
                personArray.append(person)
            }
        }
        if !personArray.isEmpty { self.list = personArray }
    }
}
