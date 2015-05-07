request = require('request');
tumblr = require('tumblrbot')

onTick = ->
  getPostRandomly sendToSlack

getPostRandomly = (cb) ->
  tumblr.posts("sagaraya.tumblr.com").random (post) ->
    #console.dir post
    text = []
    text.push "> " + post.text if post.text
    text.push post.photos[0].original_size.url if post.photos
    text.push post.post_url
    cb( text.join("\n") )

sendToSlack = (text) ->
  data = {
    "url": process.env.SLACK_HOOK_URL
    "body": JSON.stringify {
      "channel": "#random"
      "username": "Tumblr"
      "text": text
      "icon_url": "https://secure.assets.tumblr.com/images/apple-touch-icon-152x152.png"
    }
  }
  request.post data, (error, response, body) ->
    console.log body

try
  CronJob = require('cron').CronJob
  job = new CronJob({
    # 秒 分 時 日 月 曜日
    cronTime: '00 00 11,15 */02 * *'
    #cronTime: '* 00-59/1 * * * *' # test -> １秒毎に実行される. 秒が*だとすべてにあてはまる
    #cronTime: '*/5 00-59/1 * * * *' # test -> ５秒毎に実行される
    onTick: onTick
    start: true
    timeZone: 'Asia/Tokyo'
  });
catch e
  console.log 'invalid cron'
