from app.repositories.mock_repository import MockRepository
from app.schemas.goal import GoalSummary
from app.schemas.plan import WeeklyPlanResponse
from app.schemas.workout import WorkoutLogRequest, WorkoutLogResponse, WorkoutTemplate


class PlanningService:
    """MVP planning service with deterministic mock responses."""

    def __init__(self, repository: MockRepository | None = None) -> None:
        self.repository = repository or MockRepository()

    def list_goals(self) -> list[GoalSummary]:
        return [GoalSummary.model_validate(item) for item in self.repository.list_goals()]

    def current_plan(self) -> WeeklyPlanResponse:
        return WeeklyPlanResponse.model_validate(self.repository.current_plan())

    def workout_library(self) -> list[WorkoutTemplate]:
        return [WorkoutTemplate.model_validate(item) for item in self.repository.workout_library()]

    def log_workout(self, payload: WorkoutLogRequest) -> WorkoutLogResponse:
        return WorkoutLogResponse(
            status="logged",
            message="Workout saved. Adaptive rescheduling can use this event later.",
            logged_session_id=payload.session_id,
        )
