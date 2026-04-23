from fastapi import APIRouter

from app.schemas.goal import GoalSummary
from app.services.planning import PlanningService

router = APIRouter(tags=["goals"])


@router.get("/goals", response_model=list[GoalSummary])
async def list_goals() -> list[GoalSummary]:
    return PlanningService().list_goals()
