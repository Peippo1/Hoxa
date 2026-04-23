from app.repositories.mock_repository import MockRepository
from app.schemas.social import SocialFeedItem


class SocialService:
    def __init__(self, repository: MockRepository | None = None) -> None:
        self.repository = repository or MockRepository()

    def feed(self) -> list[SocialFeedItem]:
        return [SocialFeedItem.model_validate(item) for item in self.repository.social_feed()]
