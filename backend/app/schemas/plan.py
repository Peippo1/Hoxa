from pydantic import BaseModel


class PlanSession(BaseModel):
    id: str
    day: str
    title: str
    session_type: str
    duration_minutes: int
    effort: str
    location: str
    status: str
    reason: str


class WeeklyPlanResponse(BaseModel):
    id: str
    goal_id: str
    week_of: str
    headline: str
    focus: list[str]
    sessions: list[PlanSession]
    adjustment_rules: list[str]
