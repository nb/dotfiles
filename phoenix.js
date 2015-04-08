function centerWindowInFrame( window, targetFrame ) {
	var windowFrame = window.frame(),
		targetFrameCenter = {x: targetFrame.x + targetFrame.width / 2, y: targetFrame.y + targetFrame.height / 2};
	window.setTopLeft( {x: targetFrameCenter.x - windowFrame.width / 2, y: targetFrameCenter.y - windowFrame.height / 2} );
}

function maximizeWindowInFrame( window, targetFrame ) {
	window.setFrame( targetFrame );
}

function windowFitsInFrame( window, targetFrame ) {
	var windowFrame = window.frame();
	return ( windowFrame.width <= targetFrame.width && windowFrame.height <= targetFrame.height );
}

function bindLaunch( key, modifiers, appName ) {
	api.bind( key, modifiers, function() {
		api.launch( appName );
	} );
}

function frameOfNextScreen( window ) {
	if ( ! window || ! window.screen().nextScreen() ) {
		return;
	}
	return window.screen().nextScreen().frameWithoutDockOrMenu();
}

var debugMode = true;
function debug( message ) {
	if ( debugMode ) api.alert( message );
}

/***********************************************
 * BINDINGS
 ***********************************************/

debugMode = false;

var triple = ['ctrl','alt','cmd'];

api.bind( 'space', triple, function() {
	debug( 'Maximizing current window' );
	Window.focusedWindow().maximize();
} );

api.bind( 't', triple, function() {
	debug( 'Showing title' );
	api.alert( Window.focusedWindow().app().title(), 3 );
} );

api.bind( 'n', triple, function() {
	debug( 'Center in next screen' );
	var window = Window.focusedWindow(),
		nextScreenFrame = frameOfNextScreen( window );
	if ( !window || !nextScreenFrame ) {
		return;
	}
	if ( windowFitsInFrame( window, nextScreenFrame ) ) {
		centerWindowInFrame( window, nextScreenFrame );
	} else {
		maximizeWindowInFrame( window, nextScreenFrame );
	}
} );

api.bind( 'b', triple, function() {
	debug( 'Maximize in next screen' );
	var window = Window.focusedWindow(),
		nextScreenFrame = frameOfNextScreen( window );
	if ( !window || !nextScreenFrame ) {
		return;
	}
	maximizeWindowInFrame( window, nextScreenFrame );
} );

api.bind( 'w', triple, function() {
	debug( 'Moving to top-left' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();
	win.setTopLeft( {x: screenFrame.x, y: screenFrame.y} );
} );

api.bind( 'l', triple, function() {
	debug( 'Moving to left-half' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();
	win.setFrame( {x: screenFrame.x, y: screenFrame.y, width: screenFrame.width / 2, height: screenFrame.height} );
} );

api.bind( 'r', triple, function() {
	debug( 'Moving to right-half' );
	var win = Window.focusedWindow(),
		screenFrame = win.screen().frameWithoutDockOrMenu();
	win.setFrame( {x: screenFrame.x + screenFrame.width / 2, y: screenFrame.y, width: screenFrame.width / 2, height: screenFrame.height} );
} );

bindLaunch( '/', ['cmd'], 'iTerm' );
bindLaunch( ';', ['cmd'], 'MacVim' );
bindLaunch( '\'', ['cmd'], 'Safari' );
bindLaunch( '\'', ['ctrl'], 'Firefox' );
bindLaunch( ';', ['ctrl'], 'Google Chrome' );
bindLaunch( '.', ['cmd'], 'Slack' );
bindLaunch( '.', ['cmd', 'shift'], 'Skype' );
bindLaunch( '.', ['cmd', 'ctrl'], 'LimeChat' );
bindLaunch( '\\', ['cmd', 'shift'], 'The Hit List' );
bindLaunch( '\\', ['cmd', 'ctrl'], 'Simplenote' );
bindLaunch( '\'', ['cmd', 'ctrl'], 'Mail' );
bindLaunch( '\'', ['cmd', 'shift'], 'Mailplane 3' );
bindLaunch( '\\', ['cmd'], 'iTunes' );
bindLaunch( 'm', triple, 'MPlayer OSX Extended' );
bindLaunch( 'k', ['cmd', 'ctrl'], 'Keynote' );

