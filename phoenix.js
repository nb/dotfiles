const debugMode = true;
function debug(message) {
  if (debugMode) Phoenix.log(message);
}

function centerWindowInFrame(window, targetFrame) {
  const windowFrame = window.frame(),
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
  const windowFrame = window.frame();
  return (
    windowFrame.width <= targetFrame.width &&
    windowFrame.height <= targetFrame.height
  );
}

function frameOfNextScreen(window) {
  if (!window || !window.screen().next()) {
    return;
  }
  return window.screen().next().flippedVisibleFrame();
}

const triple = ["ctrl", "alt", "cmd"];
function bindLaunch(key, modifiers, appName) {
  Key.on(key, modifiers, function () {
    App.launch(appName).focus();
  });
}

Key.on("c", triple, function () {
  debug("Centering in screen");
  const window = Window.focused(),
    nextScreenFrame = window.screen().flippedVisibleFrame();
  centerWindowInFrame(window, nextScreenFrame);
});

Key.on("space", triple, function () {
  debug("Maximizing current window");
  Window.focused().maximize();
});

Key.on("n", triple, function () {
  debug("Center in next screen");
  const window = Window.focused();
  const nextScreenFrame = frameOfNextScreen(window);
  if (!window || !nextScreenFrame) {
    return;
  }
  if (windowFitsInFrame(window, nextScreenFrame)) {
    debug("fits!");
    centerWindowInFrame(window, nextScreenFrame);
  } else {
    maximizeWindowInFrame(window, nextScreenFrame);
  }
});

Key.on("w", triple, function () {
  debug("Moving to top-left");
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setTopLeft({ x: screenFrame.x, y: screenFrame.y });
});

Key.on("l", triple, function () {
  debug("Moving to left-half");
  const window = Window.focused(),
    screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x,
    y: screenFrame.y,
    width: screenFrame.width / 2,
    height: screenFrame.height,
  });
});

Key.on("r", triple, function () {
  debug("Moving to right-half");
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x + screenFrame.width / 2,
    y: screenFrame.y,
    width: screenFrame.width / 2,
    height: screenFrame.height,
  });
});

Key.on("u", triple, function () {
  debug("Moving to upper-half");
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x,
    y: screenFrame.y,
    width: screenFrame.width,
    height: screenFrame.height / 2,
  });
});

Key.on("d", triple, function () {
  debug("Moving to lower-half");
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x,
    y: screenFrame.y + screenFrame.height / 2,
    width: screenFrame.width,
    height: screenFrame.height / 2,
  });
});

bindLaunch("/", ["cmd"], "iTerm");
bindLaunch(";", ["cmd"], "Visual Studio Code");
bindLaunch("'", ["cmd"], "Safari");
bindLaunch("'", ["ctrl"], "Firefox Developer Edition");
bindLaunch(";", ["ctrl"], "Google Chrome Canary");
bindLaunch(".", ["cmd"], "Slack");
bindLaunch("\\", ["cmd", "ctrl"], "Simplenote");
bindLaunch("\\", ["cmd", "shift"], "zoom.us");
bindLaunch("'", ["cmd", "shift"], "Mailplane");
bindLaunch("k", ["cmd", "ctrl"], "Keynote");
bindLaunch("t", ["cmd", "ctrl"], "Telegram");
bindLaunch("r", ["cmd", "ctrl"], "Roam Research");
bindLaunch("k", ["cmd", "ctrl"], "Xcode");
