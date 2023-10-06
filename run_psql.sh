#!/bin/bash

POSTGRES_MASKED_URL=postgresql://toto:xxx@localhost:5432
POSTGRES_URL=postgresql://toto:PNJ@localhost:5432

echo psql $POSTGRES_MASKED_URL
psql $POSTGRES_URL