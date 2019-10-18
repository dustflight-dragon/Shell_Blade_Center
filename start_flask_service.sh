#!/bin/sh

service_path=/usr/local/project_collection/python_application/DustFlight_Collection/
service_name=main.py
service_option=server

start_flask_service()
{
    python $service_path$service_name $service_option
}

main()
{
    start_flask_service
}

main