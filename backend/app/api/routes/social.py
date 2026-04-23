from fastapi import APIRouter

from app.schemas.social import SocialFeedItem
from app.services.social import SocialService

router = APIRouter(tags=["social"])


@router.get("/social/feed", response_model=list[SocialFeedItem])
async def social_feed() -> list[SocialFeedItem]:
    return SocialService().feed()
