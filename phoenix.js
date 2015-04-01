function moveToScreen(window, screen) {
	if ( !window || !screen ) return;
	var windowFrame = window.frame(),
		newScreenFrame = screen.frameWithoutDockOrMenu(),
		newScreenCenter = {x: newScreenFrame.x + newScreenFrame.width / 2, y: newScreenFrame.y + newScreenFrame.height / 2};
	if ( windowFrame.width <= newScreenFrame.width && windowFrame.height <= newScreenFrame.height ) {
		window.setTopLeft( {x: newScreenCenter.x - windowFrame.width / 2, y: newScreenCenter.y - windowFrame.height / 2} );
	} else {
		window.setTopLeft( {x: newScreenFrame.x, y: newScreenFrame.y} );
		window.maximize();
	}
}

var debugMode = true;
function debug( message ) {
	if ( debugMode ) api.alert( message );
}

/***********************************************
 * BINDINGS
 ***********************************************/

debugMode = true;

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
	debug( 'Moving to next screen' );
	var win = Window.focusedWindow();
	moveToScreen( win, win.screen().nextScreen() );
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
