from app.data.mock_data import CURRENT_PLAN, GOALS, INTEGRATIONS, PROGRESS_METRICS, SOCIAL_FEED, WORKOUT_LIBRARY


class MockRepository:
    """Single lightweight source for mock seed data used across services."""

    def list_goals(self) -> list[dict]:
        return GOALS

    def current_plan(self) -> dict:
        return CURRENT_PLAN

    def workout_library(self) -> list[dict]:
        return WORKOUT_LIBRARY

    def progress_metrics(self) -> list[dict]:
        return PROGRESS_METRICS

    def social_feed(self) -> list[dict]:
        return SOCIAL_FEED

    def integration_records(self) -> list[dict]:
        return INTEGRATIONS
