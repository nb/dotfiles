const debugMode = true;
function debug(message) {
  if (debugMode) Phoenix.log(message);
}

function centerWindowInFrame(window, targetFrame) {
    var windowFrame = window.frame(),
      targetFrameCenter = {
        x: targetFrame.x + targetFrame.width / 2,
        y: targetFrame.y + targetFrame.height / 2,
      };
    window.setTopLeft({
      x: targetFrameCenter.x - windowFrame.width / 2,
      y: targetFrameCenter.y - windowFrame.height / 2,
    });
}

function maximizeWindowInFrame(window, targetFrame) {
    window.setFrame(targetFrame);
  }
  
  function windowFitsInFrame(window, targetFrame) {
    var windowFrame = window.frame();
    return (
      windowFrame.width <= targetFrame.width &&
      windowFrame.height <= targetFrame.height
    );
  }
  
function frameOfNextScreen(window) {
    if (!window || !window.screen().next()) {
      return;
    }
    return window
      .screen()
      .next()
      .visibleFrame();
}

const triple = ["ctrl", "alt", "cmd"];
function bindLaunch(key, modifiers, appName) {
    Key.on(key, modifiers, function() {
        App.launch(appName).focus()
    });
  }

  Key.on("c", triple, function() {
    debug("Centering in screen");
    const window = Window.focused(),
      nextScreenFrame = window.screen().visibleFrame();
    centerWindowInFrame(window, nextScreenFrame);
  });

  Key.on("space", triple, function() {
    debug("Maximizing current window");
    Window.focused().maximize();
  });

  Key.on("n", triple, function() {
    debug("Center in next screen");
    var window = Window.focused(),
      nextScreenFrame = frameOfNextScreen(window);
    if (!window || !nextScreenFrame) {
      return;
    }
    if (windowFitsInFrame(window, nextScreenFrame)) {
      centerWindowInFrame(window, nextScreenFrame);
    } else {
      maximizeWindowInFrame(window, nextScreenFrame);
    }
  });

  Key.on("w", triple, function() {
    debug("Moving to top-left");
    var window = Window.focused(),
      screenFrame = window.screen().visibleFrame();
    window.setTopLeft({ x: screenFrame.x, y: screenFrame.y });
  });

  Key.on("l", triple, function() {
    debug("Moving to left-half");
    const window = Window.focused(),
      screenFrame = window.screen().visibleFrame();
    window.setFrame({
      x: screenFrame.x,
      y: screenFrame.y,
      width: screenFrame.width / 2,
      height: screenFrame.height,
    });
  });

  Key.on("r", triple, function() {
    debug("Moving to right-half");
    var window = Window.focused(),
      screenFrame = window.screen().visibleFrame();
    window.setFrame({
      x: screenFrame.x + screenFrame.width / 2,
      y: screenFrame.y,
      width: screenFrame.width / 2,
      height: screenFrame.height,
    });
  });

  bindLaunch("/", ["cmd"], "iTerm");
  bindLaunch(";", ["cmd"], "Visual Studio Code");
  bindLaunch("'", ["cmd"], "Safari");
  bindLaunch("'", ["ctrl"], "Firefox");
  bindLaunch(";", ["ctrl"], "Google Chrome Canary");
  bindLaunch(".", ["cmd"], "Slack");
  bindLaunch(".", ["cmd", "shift"], "Skype");
  bindLaunch(".", ["cmd", "ctrl"], "LimeChat");
  bindLaunch(";", ["cmd", "ctrl"], "Calendar");
  bindLaunch("\\", ["cmd", "ctrl"], "Simplenote");
  bindLaunch("\\", ["cmd", "shift"], "zoom.us");
  bindLaunch("'", ["cmd", "ctrl"], "Mail");
  bindLaunch("'", ["cmd", "shift"], "Mailplane");
  bindLaunch("\\", ["cmd"], "Music");
  bindLaunch("m", triple, "MPlayer OSX Extended");
  bindLaunch("k", ["cmd", "ctrl"], "Keynote");
  bindLaunch("x", ["cmd", "ctrl"], "GitX");
  bindLaunch("p", ["cmd", "ctrl"], "WordPress.com");
  bindLaunch("t", ["cmd", "ctrl"], "Telegram");
  bindLaunch("d", ["cmd", "ctrl"], "Deckset");
  bindLaunch("r", ["cmd", "ctrl"], "Roam Research");
  