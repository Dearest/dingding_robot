###USAGE
1. set DingDing robot access_token, replace 'xxxxx' to your own access_token
```ruby
# gocn_spider.rb
ROBOT = 'https://oapi.dingtalk.com/robot/send?access_token=xxxxx'
```
2. set whenver schedule path and time
```ruby
every :day, at: '13:45 pm' do
  command 'cd $(you project path) && ruby main.rb'
end
```
3. set crontab
```
$ whenever
# if update schedule.rb
$ whenever --update-crontab
```

#### other
```
$ whenever --crontab-command 'sudo crontab` # override the crontab command
```
[whenever github](https://github.com/javan/whenever)