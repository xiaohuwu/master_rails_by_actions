#########################################################################
# File Name: start.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 五  3/24 13:58:36 2017
#########################################################################
#!/bin/bash
bundle exec puma -C config/puma.rb
#bundle exec sidekiq  -C config/sidekiq.yml -d -e development
echo "* Port is 3000"