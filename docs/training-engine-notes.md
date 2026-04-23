# Hoxa Training Engine Notes

## Objective

The Hoxa training engine should generate and maintain a realistic weekly plan for hybrid fitness users without pretending to be magical. The first version should be rule-based, inspectable, and easy to tune.

## Inputs

The future planning engine should consider:

- active goal
- target date or block length
- current fitness level
- preferred training types
- available equipment
- preferred training days
- schedule constraints
- recent training history
- completion and missed session history
- recovery and soreness signals

## Core Planning Logic

### 1. Build a weekly target mix

Examples:

- first 5K: 2 runs, 2 strength, 1 mobility
- faster 10K: 2 to 3 runs, 2 strength, 1 mobility
- first half marathon: 3 runs, 2 strength, 1 mobility or recovery
- strength consistency: 3 strength, 1 run, 1 mobility

### 2. Place anchor sessions first

Anchor sessions are the hardest-to-miss sessions that drive the goal:

- long run for half marathon plans
- quality run for pace-oriented 10K plans
- main upper body session for a chest strength goal

### 3. Place support sessions around anchors

Support sessions should reinforce the goal while protecting recovery:

- strength around run plans
- mobility after harder days
- balance and recovery where schedule density is high

### 4. Protect spacing

Rules should avoid:

- stacking hard sessions back to back by default
- placing long run and lower-body strength too close together
- dropping mobility first every time the week gets busy

## Missed Workout Logic

When a session is missed, the planner should:

1. decide whether the session is an anchor or support session
2. look for the next viable slot in the same week
3. reduce lower-priority work before sacrificing anchor work
4. avoid carrying too much unfinished load into the next week

## Recovery Logic

The MVP should keep recovery signals simple:

- recent session density
- number of hard sessions in the last 7 days
- user-reported soreness or energy
- imported training load later via Apple Health or Garmin

## What Not To Do In MVP

- do not build black-box coaching claims
- do not claim injury prediction
- do not overfit for every edge case
- do not depend on AI to make the product coherent

## Realistic Evolution Path

### Phase 1

- deterministic weekly templates by goal type
- rule-based rescheduling
- simple progression over time

### Phase 2

- account for imported workout history
- adjust run or strength volume based on consistency and fatigue trends
- support plan blocks and deload weeks

### Phase 3

- stronger recommendation layer with better prioritisation and recovery weighting
- optional adaptive messaging that explains why the week changed
