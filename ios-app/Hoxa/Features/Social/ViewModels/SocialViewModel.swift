import Foundation

struct SocialViewModel {
    let appModel: AppModel

    var currentUser: DemoUser {
        appModel.currentUser
    }

    var activities: [SocialActivity] {
        appModel.socialActivities
    }

    var following: [FollowingProfile] {
        appModel.followingProfiles
    }

    var summary: DemoSocialSummary {
        appModel.socialSummary
    }
}
