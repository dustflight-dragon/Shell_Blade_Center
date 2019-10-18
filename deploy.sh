#!/usr/bin/expect


set timeout 10

send_user "Starting deploy ......"

spawn rsync -avz www admin@tree.ahtyt.com:/var/www/html/ymf_web/xzg_wechat/

expect {
    "(yes/no)?" {
        send: "yes\r"
        expect "*assword:" {
            send "xlife123\n"
        }
    }
}
"*assword:" {
    send "xlife123\n"
}

expect "100%"
expect eof

send_user "Deploy Complete !"