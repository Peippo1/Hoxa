from app.integrations.providers import list_mock_adapters
from app.repositories.mock_repository import MockRepository
from app.schemas.integration import IntegrationStatus


class IntegrationService:
    def __init__(self, repository: MockRepository | None = None) -> None:
        self.repository = repository or MockRepository()

    def list_connections(self) -> list[IntegrationStatus]:
        integration_records = self.repository.integration_records()
        adapter_state = {adapter.provider: adapter.implementation_state for adapter in list_mock_adapters()}

        normalized = []
        for record in integration_records:
            provider = record["provider"]
            state = adapter_state.get(provider, record["status"])
            normalized.append(
                {
                    **record,
                    "status": state,
                }
            )

        return [IntegrationStatus.model_validate(item) for item in normalized]
