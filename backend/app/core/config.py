import os
from dataclasses import dataclass, field


def _split_csv(value: str) -> list[str]:
    return [item.strip() for item in value.split(",") if item.strip()]


@dataclass(slots=True)
class Settings:
    app_name: str = os.getenv("HOXA_APP_NAME", "Hoxa API")
    app_version: str = os.getenv("HOXA_APP_VERSION", "0.1.0")
    environment: str = os.getenv("HOXA_ENV", "development")
    allowed_origins: list[str] = field(
        default_factory=lambda: _split_csv(
            os.getenv("HOXA_ALLOWED_ORIGINS", "http://localhost:3000,http://127.0.0.1:3000")
        )
    )


settings = Settings()
