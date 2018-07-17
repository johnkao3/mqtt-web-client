var websocketclient = {
  client: '',
  messages: [],
  connect(options) {
    let host = options.host
    let port = options.port
    
    this.client = mqtt.connect(options)
  },
  disconnect(callback) {
    this.client.end(callback())
    this.client = ''
  },
  subscribe(topic,qos) {
    this.client.subscribe(topic,qos)
    // this.client.publish(topic, 'Hello mqtt')
  }
}

module.exports = websocketclient;
