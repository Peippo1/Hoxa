from dataclasses import dataclass


@dataclass(slots=True)
class IntegrationAdapter:
    provider: str
    capability: str
    implementation_state: str


def list_mock_adapters() -> list[IntegrationAdapter]:
    return [
        IntegrationAdapter(
            provider="Apple Health",
            capability="Workout history and recovery import",
            implementation_state="mock-ready",
        ),
        IntegrationAdapter(
            provider="Garmin",
            capability="Imported run and activity history",
            implementation_state="planned",
        ),
        IntegrationAdapter(
            provider="Google Calendar",
            capability="Availability windows for plan placement",
            implementation_state="mock-ready",
        ),
        IntegrationAdapter(
            provider="Apple Calendar / iCal",
            capability="Availability and future workout write-back",
            implementation_state="planned",
        ),
    ]
