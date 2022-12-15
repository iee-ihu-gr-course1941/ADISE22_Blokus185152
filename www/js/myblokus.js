var me={token:null,piece_color:null};
var game_status={};



$(function () {
	draw_empty_board(null);
    fill_board();
	//console.log("aaa");
    //$('blokus_reset').click(reset_board);
	$('#blokus_login').click( login_to_game);
});

function draw_empty_board(p) {
	
	if(p!='B') {p='R';}
	var draw_init = {
		'R': {i1:20,i2:0,istep:-1,j1:1,j2:21,jstep:1},
		'B': {i1:1,i2:21,istep:1, j1:20,j2:0,jstep:-1}
	};
	var s=draw_init[p];
	var t='<table id="blokus_table">';
	for(var i=s.i1;i!=s.i2;i+=s.istep) {
		t += '<tr>';
		for(var j=s.j1;j!=s.j2;j+=s.jstep) {
			t += '<td class="blokus_square" id="square_'+j+'_'+i+'">' + j +','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	
	$('#blokus_board').html(t);
	//$('.blokus_square').click(click_on_piece);
}

function fill_board() {
	$.ajax(
        {url: "blokus.php/board/",
        success: fill_board_by_data }
        );
	
}

function login_to_game() {
	//console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	//console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!2");
	var p_color = $('#pcolor').val();
	draw_empty_board(p_color);
	fill_board();
	//console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!3");
	$.ajax({url: "blokus.php/players/"+p_color, 
			method: 'PUT',
			dataType: "json",
			headers: {"X-Token": me.token},
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), piece_color: p_color}),
			success: login_result,
			error: login_error});
}

function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_status_update();
	console.log("bbbb");
}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
}

function game_status_update() {
	
	clearTimeout(timer);
	$.ajax({url: "blokus.php/status/", success: update_status,headers: {"X-Token": me.token} });
}

function update_status(data) {
	last_update=new Date().getTime();
	var game_stat_old = game_status;
	game_status=data[0];
	update_info();
	clearTimeout(timer);
	if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
		x=0;
		// do play
		if(game_stat_old.p_turn!=game_status.p_turn) {
			fill_board();
		}
		$('#move_div').show(1000);
		timer=setTimeout(function() { game_status_update();}, 15000);
	} else {
		// must wait for something
		$('#move_div').hide(1000);
		timer=setTimeout(function() { game_status_update();}, 4000);
	}
 	
}

function update_info(){
	$('#game_info').html("I am Player: "+me.piece_color+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');	
}

function reset_board() {
	$.ajax(
        {url: "blokus.php/board/",
        method:'post',  
         success: fill_board_by_data }
         );
		
	
}

class ParsedData {
	xA;
	yA;
	piece_color;
	piece_shape;

	constructor(xA, yA, piece_color, piece_shape) {
		this.xA = xA;
		this.yA = yA;
		this.piece_color = piece_color;
		this.piece_shape = piece_shape;
	}
}

function fill_board_by_data(data) {
	//const parsedData = JSON.parse(data);
	//const array = [];

	// parsedData.forEach(element => {
	// 	array.push(new ParsedData(element.xA, element.yA, element.piece_color, element.piece_shape));
	// });

	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.xA +'_' + o.yA;
		var c = (o.piece_shape!=null)?o.piece_color:'';
		var pc= (o.piece_shape!=null)?'piece'+o.piece_color:'';
		var im = (o.piece_shape!=null)?'<img class="piece" src="images/'+c+'.jpg">':'';
        
		$(id).addClass(o.piece_color+'_square').html(im);	
	}
 
}