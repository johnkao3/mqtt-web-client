<mqtt_main>
  <div class="list accordion-list">
    <ul>
      <li class="accordion-item accordion-item-opened" id="connect">
        <a href="" class="item-link item-content">
          <div class="item-inner">
            <div class="item-title">
              連線狀態 
              <i class="icon f7-icons color-green" if="{connected}">check_round</i>
              <i class="icon f7-icons color-red" if="{!connected}">close_round</i>
            </div>
          </div>
        </a>
        <div class="accordion-item-content">
          <div class="row">
            <div class="col-50">
              <div class="list">
                <ul>
                  <li class="item-content item-input">
                    <div class="item-inner">
                      <div class="item-title item-label">Host</div>
                      <div class="item-input-wrap">
                        <input type="text" value="" id="host">
                        <span class="input-clear-button"></span>
                      </div>
                    </div>
                  </li>
                  <li class="item-content item-input">
                    <div class="item-inner">
                      <div class="item-title item-label">Port</div>
                      <div class="item-input-wrap">
                        <input type="text" value="" id="port">
                        <span class="input-clear-button"></span>
                      </div>
                    </div>
                  </li>
                  <li class="item-content item-input">
                    <div class="item-inner">
                      <div class="item-title item-label">ClientID</div>
                      <div class="item-input-wrap">
                        <input type="text">
                        <span class="input-clear-button"></span>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-50">
              <div class="list">
                <ul>
                  <li class="item-content item-input">
                    <div class="item-inner">
                      <div class="item-title item-label">Username</div>
                      <div class="item-input-wrap">
                        <input type="text" value="" id="username">
                        <span class="input-clear-button"></span>
                      </div>
                    </div>
                  </li>
                  <li class="item-content item-input">
                    <div class="item-inner">
                      <div class="item-title item-label">Password</div>
                      <div class="item-input-wrap">
                        <input type="password" value="" id="password">
                        <span class="input-clear-button"></span>
                      </div>
                    </div>
                  </li>                  
                </ul>
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="block block-strong">
    <button 
      if="{!connected}"
      class="button" onclick="{connect}">Connect</button>
    <button 
      if="{connected}"
      class="button color-red " onclick="{disconnect}">Disconnect</button>
  </div>  
  <div class="row">
    <div class="col-25">
      <subscribe_main
        subs="{subs}"
        ref="sub"
      ></subscribe_main>
    </div>
    <div class="col-75">
      <publish_main></publish_main>
      <div if="{messages != []}" id="msg-card-content">
        <msg-card
          each="{msg, index in messages}">
        </msg-card>
      </div>
    </div>
  </div>
  <style>
    #msg-card-content {
      overflow: auto;
    }
  </style>
  <script>
    import publish_main from '../cmps/publish.tag'
    import subscribe_main from '../cmps/subscribe.tag'
    import '../cmps/msg-card.tag'

    import _ from 'lodash'

    var cmp = this

    cmp.subs = []

    cmp.connected = false

    cmp.messages = []

    cmp.on('mount', function() {
    })
    
    cmp.connect = function() {
      
      var host = document.getElementById('host').value
      var port = document.getElementById('port').value

      if (host.length == 0 || port.length == 0 ) {
        app.dialog.alert('Host 或 Port 不得為空白')
        return false;
      }
      
      // MQTT Options
      var options = {
        host: host,
        port: port,
        keepalive: 10,
        protocolId: 'MQTT',
        protocolVersion: 4,
        clean: true,
        reconnectPeriod: 1000,
        connectTimeout: 30 * 1000,
      }

      var username = document.getElementById('username').value;
      var password = document.getElementById('password').value;

      if (username.length > 0) {
        options.username = username
      }

      if (password.length > 0) {
        options.password = password
      }

      mqttclient.connect(options);

      mqttclient.client.on('error', function(err) {
        console.log(err)
      })
      
      mqttclient.client.on('connect', function() {
        cmp.connected = true
        cmp.onConnect()
        cmp.update()
      })
      mqttclient.client.on('message',cmp.onMessage)
      // mqttclient.onMessage()
    }

    cmp.disconnect = function() {
      mqttclient.disconnect(function() {
        cmp.connected = false
        app.accordion.open($$("#connect"))
        // Init
        cmp.subs = []
        cmp.oriMessages = []
        cmp.messages = []
        cmp.update()
      });
    }

    cmp.subscribe = function() {
      if (typeof mqttclient.client === 'object') {
        let sub_topic = cmp.tags.subscribe_main.refs.topic.value
        let qos = document.getElementById('sub-qos').value
        if (_.find(cmp.subs, {'name': sub_topic}) ) {
          app.dialog.alert('已經 Subscribe過了...');
          return false;
        }
        mqttclient.subscribe(sub_topic, { qos: Number(qos) })
        cmp.subs.push({name:sub_topic}
        )
      }
      else {
        app.dialog.alert('MQTT 尚未連線...')
        return false;
      }
    }

    cmp.onConnect = function() {
      // app.dialog.alert('MQTT 連線成功!');
      app.accordion.close($$("#connect"))
    }

    cmp.onMessage = function(topic, message, packet) {
      console.log(packet)
      let msgObj = {
        topic:packet.topic,
        qos:packet.qos,
        payload:packet.payload.toString(),
      }
      cmp.messages.unshift(msgObj)
      cmp.update()
    }
  </script>
</mqtt_main>
