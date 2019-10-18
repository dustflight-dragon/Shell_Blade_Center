#!/usr/bin/expect

set timeout 10

send_user "Startdocker Backup ......"
spawn docker cp xpay_product:/var/log/xpayv3.log /var/log/xpay_product/
sleep 2
send_user "Docker Backup Complete"

send_user ""

send_user "Start Transfor ......"

spawn rsync -avz /var/log/xpay_product/xpayv3.log root@121.41.30.138:/var/log/121.199.2.102/xpay_product/
expect {
    "(yes/no)?"
    {
        send "yes\r";
        expect "*assword:" { send "xlife123\n" }
    }
    "*assword:"
    {
        send "xlife123\n"
    }
}
expect "100%"
expect eof

send_user "Log Transfor Complete"
