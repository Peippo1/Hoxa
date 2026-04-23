import Foundation

struct SocialViewModel {
    let appModel: AppModel

    var activities: [SocialActivity] {
        appModel.socialActivities
    }

    var following: [FollowingProfile] {
        appModel.followingProfiles
    }
}
