//
//  Book.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//

import Foundation
import FirebaseFirestoreSwift

class Book: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String?
}
