//
//  Item.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//

import Foundation
import FirebaseFirestoreSwift

class Item: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String?
}
