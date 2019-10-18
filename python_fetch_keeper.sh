#!/bin/sh

bill_name=Bill
order_name=order_notify
bill_path=/usr/local/project_collection/python_application/bill
order_notify_path=/usr/local/project_collection/python_application/order_notify
python_service=service.py

bill_service_start()
{
    echo Staring $bill_name Python Service ...
    python $bill_path/$python_service
    echo $bill_name Start complete ...
}

order_notify_service_start()
{
    echo Staring $bill_name Python Service ...
    python $order_notify_path/$python_service
    echo $order_name Start complete ...
}

take_result_process() {
    result_process_number=`ps -elf | grep python | grep -v grep | wc -l`
    if [ $result_process_number -ge 2 ]; then
        echo $bill_name has been started
        echo $order_name has been started
    else
        echo Python Service Invalid ...
        echo Please Check The Result ...
    fi
}

python_service_start()
{
    process_number=`ps -elf | grep python | grep -v grep | wc -l`
    echo Process Number => $process_number
    
    if [ $process_number -ge 2 ]; then
        echo $bill_name has been started
        echo $order_name has been started
    else
        bill_service_start
        order_notify_service_start
        take_result_processtake_result_process
    fi
}

main()
{
    python_service_start
}

main
