import Foundation

struct Post: Codable, Identifiable {
  var id: UUID?
  var caption: String
  var createdAt: Date
}
