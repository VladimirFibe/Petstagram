import Foundation

struct Post: Codable, Identifiable {
  var id: UUID?
  var caption: String
  var createdAt: Date
  var createdByUser: String
  
  init(id: UUID? = nil,
       caption: String,
       createdAt: Date = Date(),
       createdBy: String = currentUser?.id ?? "") {
    self.id = id
    self.createdAt = createdAt
    self.createdByUser = createdBy
    self.caption = caption
  }
}
