from pydantic import BaseModel


class SocialFeedItem(BaseModel):
    id: str
    name: str
    action: str
    detail: str
    props: int
