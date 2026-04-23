from fastapi import APIRouter

from app.api.routes.goals import router as goals_router
from app.api.routes.health import router as health_router
from app.api.routes.integrations import router as integrations_router
from app.api.routes.plans import router as plans_router
from app.api.routes.progress import router as progress_router
from app.api.routes.social import router as social_router
from app.api.routes.workout_logs import router as workout_logs_router
from app.api.routes.workouts import router as workouts_router

api_router = APIRouter()
api_router.include_router(health_router)
api_router.include_router(goals_router, prefix="/api")
api_router.include_router(plans_router, prefix="/api")
api_router.include_router(workouts_router, prefix="/api")
api_router.include_router(workout_logs_router, prefix="/api")
api_router.include_router(progress_router, prefix="/api")
api_router.include_router(social_router, prefix="/api")
api_router.include_router(integrations_router, prefix="/api")
