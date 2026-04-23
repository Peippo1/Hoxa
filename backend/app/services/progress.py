from app.repositories.mock_repository import MockRepository
from app.schemas.progress import ProgressMetric, ProgressSummaryResponse


class ProgressService:
    def __init__(self, repository: MockRepository | None = None) -> None:
        self.repository = repository or MockRepository()

    def summary(self) -> ProgressSummaryResponse:
        metrics = [ProgressMetric.model_validate(item) for item in self.repository.progress_metrics()]
        return ProgressSummaryResponse(
            metrics=metrics,
            balance_note="Mobility and recovery remain first-class signals in the progress model.",
        )
