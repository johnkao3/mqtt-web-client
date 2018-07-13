<app_main>
 <!-- App root element -->
 <div id="app">
    <!-- Statusbar overlay -->
    <div class="statusbar"></div>

    <!-- Your main view, should have "view-main" class -->
    <div class="view view-main">
      <!-- Initial Page, "data-name" contains page name -->
      <div data-name="home" class="page">

        <!-- Top Navbar -->
        <div class="navbar">
          <div class="navbar-inner">
            <div class="title">MQTT Client</div>
          </div>
        </div>

        <!-- Toolbar -->
        <div class="toolbar">
          <div class="toolbar-inner">
            <!-- Toolbar links -->

          </div>
        </div>

        <!-- Scrollable page content -->
        <div class="page-content">
          <mqtt_main></mqtt_main>
        </div>
      </div>
    </div>
  </div>  
  <style></style>
  <script>
    import mqtt_main from './pages/mqtt.tag'

  </script>
</app_main>