from pydantic import BaseModel


class GoalSummary(BaseModel):
    id: str
    title: str
    goal_type: str
    target_date: str | None
    tagline: str
    weekly_mix: str
