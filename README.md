ランダムにtumblrのpostをピックアップして、slackに流す

# setup

## set env
get slcak incoming webhook url.
get tumblr oauth consumer key.

```
echo 'export SLACK_HOOK_URL=YOUR_SLACK_HOOK_URL' >> ~/.bash_profile
echo 'export HUBOT_TUMBLR_API_KEY=YOUR_COUNSUMER_KEY' >> ~/.bash_profile
```

## install dependencies
```
npm install
```


# run
```
./node_modules/.bin/coffee randomTumblrToSlack.coffee
```

or run background

```
nohup ./node_modules/.bin/coffee randomTumblrToSlack.coffee &
```

# メモ
node-slack 0.0.5 を使おうとしたが、うまくいかなかった（バグ？）ので、requestで直接POSTすることにした。
