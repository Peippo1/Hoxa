from fastapi import APIRouter

from app.schemas.integration import IntegrationStatus
from app.services.integrations import IntegrationService

router = APIRouter(tags=["integrations"])


@router.get("/integrations", response_model=list[IntegrationStatus])
async def integrations() -> list[IntegrationStatus]:
    return IntegrationService().list_connections()
