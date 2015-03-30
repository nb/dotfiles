var triple = ['ctrl','alt','cmd'];

api.bind( 'space', triple, function() {
	Window.focusedWindow().maximize();
} );

api.bind( 't', triple, function() {
	api.alert( Window.focusedWindow().app().title(), 3 );
} );
