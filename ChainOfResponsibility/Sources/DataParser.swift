//
//  DataParser.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import Foundation
class DataParser<T: ResponseProtocol>: ParserProtocol {
    var next: ParserProtocol?
    func parse(data: Data) -> [Person]? {
        guard let persons = parseData(ofType: T.self, data: data) else {
            let persons = self.next?.parse(data: data)
            return persons
        }
        return persons
    }

    private func parseData(ofType: T.Type, data: Data) -> [Person]? {
        let response = try? JSONDecoder().decode(T.self, from: data)
        return response?.list
    }
}
