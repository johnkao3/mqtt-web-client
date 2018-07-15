<publish_main>
  <div class="block-title">Publish</div>
  <div class="list">
    <ul>
      <li class="item-content item-input">
        <div class="item-inner">
          <div class="item-title item-label">Topic</div>
          <div class="item-input-wrap">
            <input type="text" value="/demo" ref="topic">
            <span class="input-clear-button"></span>
          </div>
        </div>
      </li>
      <li class="item-content item-input">
        <div class="item-inner">
          <div class="item-title item-label">Message</div>
          <div class="item-input-wrap">
            <input type="text" value="Hello MQTT Client" ref="msg">
            <span class="input-clear-button"></span>
          </div>
        </div>
      </li>
      <li class="item-content item-input">
        <div class="item-inner">
          <div class="item-title item-label">QoS</div>
          <div class="item-input-wrap">
            <select placeholder="Please choose..." id="pub-qos">
              <option value="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
            </select>
          </div>
        </div>
      </li>      
      <!-- <li class="item-content item-input">
        <div class="item-inner">
          <div class="item-title item-label">Name</div>
          <div class="item-input-wrap">
            <input type="text" placeholder="Your name">
            <span class="input-clear-button"></span>
          </div>
        </div>
      </li> -->
      <li>
        <a href="#" class="item-link list-button" onclick="{publish}">Publish</a>
      </li>
    </ul>
  </div>
  <style>
  </style>
  <script>
    var cmp = this

    cmp.on('mount', function() {

    })

    cmp.publish = function() {
       if (typeof mqttclient.client === 'object') {
        let topic = cmp.refs.topic.value
        let msg = cmp.refs.msg.value
        let qos = document.getElementById('pub-qos').value
        mqttclient.client.publish(topic, msg, { qos: Number(qos) })
      }
      else {
        app.dialog.alert('MQTT 尚未連線...')
        return false;
      }
    }
  </script>
</publish_main>