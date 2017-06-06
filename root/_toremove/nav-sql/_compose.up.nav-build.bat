call _createlinks.bat
call ..\nav\_createlinks.bat
call ..\sql\_createlinks.bat

docker-compose -f docker-compose.yml -f docker-compose.nav-build.yml -f docker-compose.configs.yml up -d

powershell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' navsql_nav_1
powershell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' navsql_sql_1