<subscribe_main>
  <div class="block-title">SubScribe</div>
  <div class="list">
    <ul>
      <li class="item-content item-input">
        <div class="item-inner">
          <div class="item-title item-label">Sub Topic</div>
          <div class="item-input-wrap">
            <input type="text" value="/demo" ref="topic">
            <span class="input-clear-button"></span>
          </div>
        </div>
      </li>
      <li class="item-content item-input">
        <div class="item-inner">
          <div class="item-title item-label">QoS</div>
          <div class="item-input-wrap">
            <select placeholder="Please choose..." id="sub-qos">
              <option value="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
            </select>
          </div>
        </div>
      </li>   
      <li>
        <a href="#" class="item-link list-button" onclick="{parent.subscribe}">Subscribe</a>
      </li>  
    </ul>
  </div>
  <div class="card"
    each="{sub in opts.subs}">
    <div class="card-content card-content-padding">
      {sub.name}
    </div>
  </div>
  <style></style>
  <script>
    var cmp = this

    cmp.subs = []

    cmp.on('mount', function() {
    })
  </script>
</subscribe_main>