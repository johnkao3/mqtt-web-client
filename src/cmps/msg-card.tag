<msg-card>
  <div class="card">
    <div class="card-header">
      Topic: {msg.topic}
    </div>
    <div class="card-content card-content-padding">
      {msg.payload}
    </div>
    <div class="card-footer">
      <div class="chip">
        <div class="chip-label">{msg.qos}</div>
      </div>
    </div>
  </div>
  <style></style>
  <script>
    var cmp = this

    cmp.on('mount', function() {

    })
  </script>
</msg-card>