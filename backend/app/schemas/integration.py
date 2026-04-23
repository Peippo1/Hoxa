from pydantic import BaseModel


class IntegrationStatus(BaseModel):
    provider: str
    status: str
    notes: str
