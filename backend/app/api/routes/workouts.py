from fastapi import APIRouter

from app.schemas.workout import WorkoutTemplate
from app.services.planning import PlanningService

router = APIRouter(tags=["workouts"])


@router.get("/workouts/library", response_model=list[WorkoutTemplate])
async def workout_library() -> list[WorkoutTemplate]:
    return PlanningService().workout_library()
