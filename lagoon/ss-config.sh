#!/bin/sh

# Override sliverstripe environment variables.
export SS_DATABASE_CLASS="MySQLDatabase"
export SS_DATABASE_SERVER="${MARIADB_HOST}"
export SS_DATABASE_NAME="${MARIADB_DATABASE}"
export SS_DATABASE_USERNAME="${MARIADB_USERNAME}"
export SS_DATABASE_PASSWORD="${MARIADB_PASSWORD}"

if [ $LAGOON_ENVIRONMENT_TYPE == "production" ]; then
    export SS_ENVIRONMENT_TYPE="live"
else
    export SS_ENVIRONMENT_TYPE="test"
fi
