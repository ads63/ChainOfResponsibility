//
//  ResponseProtocol.swift
//  ChainOfResponsibility
//
//  Created by Алексей Шинкарев on 31.03.2022.
//

import Foundation

protocol ResponseProtocol: Decodable {
    var list: [Person]? { get }
}
