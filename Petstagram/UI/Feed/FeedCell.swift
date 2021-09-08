//
//  FeedCell.swift
//  FeedCell
//
//  Created by Владимир on 07.09.2021.
//

import SwiftUI

struct FeedCell: View {
  var post: Post
  let placeholderImage = UIImage(systemName: "photo")!
  @State var postImage: UIImage? = nil
  var body: some View {
    VStack {
      Image(uiImage: postImage ?? placeholderImage)
        .resizable()
        .scaledToFit()
        .cornerRadius(15)
        .overlay({
          VStack(spacing: 15) {
            Button(action: {}) {
              Image("filled")
            }
            Button(action: {}) {
              Image("comment")
            }
            Button(action: {}) {
              Image("share")
            }
          }
          .padding()
          .shadow(radius: 3)
        }(), alignment: .bottomTrailing)
    }
    .buttonStyle(.plain)
  }
}

struct FeedCell_Previews: PreviewProvider {
  static var previews: some View {
    let createdDate = Date().advanced(by: TimeInterval(exactly: -5 * 60)!)
    let post = Post(caption: "can you code me up some food?",
                    createdAt: createdDate,
                    createdBy: "UserName")
    return Group {
      FeedCell(post: post)
      FeedCell(post: post, postImage: UIImage(named: "friends")!)
    }
  }
}
