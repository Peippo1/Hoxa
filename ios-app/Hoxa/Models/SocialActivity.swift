import Foundation

struct SocialActivity: Identifiable, Hashable {
    enum Visibility: String {
        case friends = "Friends"
        case followers = "Followers"
    }

    let id: String
    let name: String
    let action: String
    let detail: String
    let props: Int
    let visibility: Visibility
}
