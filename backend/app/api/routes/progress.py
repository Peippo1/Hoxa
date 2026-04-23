from fastapi import APIRouter

from app.schemas.progress import ProgressSummaryResponse
from app.services.progress import ProgressService

router = APIRouter(tags=["progress"])


@router.get("/progress/summary", response_model=ProgressSummaryResponse)
async def progress_summary() -> ProgressSummaryResponse:
    return ProgressService().summary()
