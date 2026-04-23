from fastapi import APIRouter, status

from app.schemas.workout import WorkoutLogRequest, WorkoutLogResponse
from app.services.planning import PlanningService

router = APIRouter(tags=["workout-logs"])


@router.post("/workout-logs", response_model=WorkoutLogResponse, status_code=status.HTTP_201_CREATED)
async def create_workout_log(payload: WorkoutLogRequest) -> WorkoutLogResponse:
    return PlanningService().log_workout(payload)
