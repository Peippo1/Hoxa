from fastapi import APIRouter

from app.schemas.plan import WeeklyPlanResponse
from app.services.planning import PlanningService

router = APIRouter(tags=["plans"])


@router.get("/plans/current", response_model=WeeklyPlanResponse)
async def current_plan() -> WeeklyPlanResponse:
    return PlanningService().current_plan()
