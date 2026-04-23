from pydantic import BaseModel


class ProgressMetric(BaseModel):
    label: str
    value: str
    change: str


class ProgressSummaryResponse(BaseModel):
    metrics: list[ProgressMetric]
    balance_note: str
