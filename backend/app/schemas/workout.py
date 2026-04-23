from pydantic import BaseModel, Field


class WorkoutTemplate(BaseModel):
    id: str
    title: str
    category: str
    duration_minutes: int
    equipment: str
    level: str


class WorkoutLogRequest(BaseModel):
    session_id: str = Field(description="Planned session identifier or library template identifier.")
    completed_duration_minutes: int = Field(ge=1, le=300)
    perceived_effort: str
    notes: str | None = None


class WorkoutLogResponse(BaseModel):
    status: str
    message: str
    logged_session_id: str
