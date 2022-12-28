var me={token:null,piece_color:null};
var game_status={};
var board={};
var repositoryR={};
var repositoryB={};
var last_update=new Date().getTime();
var timer=null;
var ok=0;

$(function () {
	draw_empty_board(null);
    fill_board();
	//console.log("aaa");
    $('#blokus_reset').click(reset_board);
	$('#blokus_login').click(login_to_game);
	$('#move_div').hide(1000);
	$('#do_move').click(do_move);
	$('#do_move2').click( do_move2);
	draw_empty_RepoR(null);
	draw_empty_RepoB(null);
	fill_RED_tables();
	fill_BLUE_tables();
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

function draw_empty_RepoR(p) {
	var t='<table id="repo_Red_table">';
	t += '<tr>';
		for(var j=1;j<22;j++) {
			t += '<td class="RED_repo_square" id="REDsquare_'+j+'">' + j +'</td>'; 
		}
	t+='</tr>';
	t+='</table>';
	
	$('#blokus_repoR').html(t);
	//$('.blokus_square').click(click_on_piece);
}




function draw_empty_RepoB(p) {
	var t='<table id="repo_Blue_table">';
	t += '<tr>';
		for(var j=1;j<22;j++) {
			t += '<td class="BLUE_repo_square" id="BLUEsquare_'+j+'">' + j +'</td>'; 
		}
	t+='</tr>';
	t+='</table>';
	
	$('#blokus_repoB').html(t);
	//$('.blokus_square').click(click_on_piece);
}

function fill_board() {
	$.ajax(
        {url: "blokus.php/board/",
        success: fill_board_by_data }
        );
	
}

function fill_RED_tables() {
	$.ajax(
		{url: "blokus.php/repository/R", 
		success: fill_RED_repo_by_data }
		);
	
}

function fill_BLUE_tables() {
	$.ajax(
        {url: "blokus.php/repository/B",
        success: fill_BLUE_repo_by_data }
        );
	
}

function check_tables(clr) {
    if(clr=='R'){
	$.ajax(
		{url: "blokus.php/repository/R", 
		success: check_repo_by_data }
		);
	}else if(clr=='B'){
	$.ajax(
		{url: "blokus.php/repository/B", 
		success: check_repo_by_data }
		);	
	}
}


function login_to_game() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	var p_color = $('#pcolor').val();
	draw_empty_board(p_color);
	fill_board();
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
	console.log("reset");
	$.ajax({url: "blokus.php/board/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_board_by_data });
	$('#move_div').hide();
	$('#game_initializer').show(2000);
	reset_repositorys();
}

function reset_repositorys() {
	console.log("RESET R");
	reset_repositorysR();
	console.log("RESET B");
	reset_repositorysB();
}

function reset_repositorysR() {
	$.ajax({url: "blokus.php/repository/R", headers: {"X-Token": me.token}, method: 'POST',  success: fill_RED_repo_by_data });
	console.log("SEMI R");
}

function reset_repositorysB() {
	$.ajax({url: "blokus.php/repository/B", headers: {"X-Token": me.token}, method: 'POST',  success: fill_BLUE_repo_by_data });
	console.log("SEMI B");
}



function do_move2() {
	$('#the_move').val($('#the_move_src').val() +' ' + $('#the_move_dest').val());
	$('.chess_square').removeClass('pmove').removeClass('tomove');
	do_move();
}

function getschm(){
	var s = $('#the_move').val();
	var a = s.trim().split(/[ ]+/);
	console.log("----------> a[1] : ");
	console.log(a[1]);
	return(a[1]);
}

function do_move() {
	var s = $('#the_move').val();
	
	var a = s.trim().split(/[ ]+/);
	if(a.length!=4) {
		alert('first is the color, second is the piece and third - forth is the position');
		return;
	}else{
		if(a[0]=='R'){
            clr='R';
			check_tables(clr);
		}else if(a[0]=='B'){
			clr='B';
			check_tables(clr);
		}
	}
	
}

function move_result(data){
	game_status_update();
	fill_board_by_data(data);
	fill_RED_tables();
	fill_BLUE_tables();
}


function fill_board_by_data(data) {
	console.log("board");
	console.log(data);
	board=data;
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.xA +'_' + o.yA;
		var c = (o.piece_shape!=null)?o.piece_color :'';
		var pc= (o.piece_shape!=null)?'piece_shape'+o.piece_color:'';
		var im = (o.piece_shape!=null)?'<img class="piece '+pc+'" src="images/'+c+'.jpg">':'';
		$(id).addClass(o.piece_shape+'_square').html(im);
	}
	
}

function fill_RED_repo_by_data(dataR) {
	repositoryR=dataR;
	console.log("repositoryR EFTASES EDW");
	console.log(repositoryR);
	for(var i=1;i<dataR.length+1;i++) {
		
		var o = dataR[i-1];
		var id = '#REDsquare_'+i;
		var c = (o.val!='W')?o.piece_shape :'';
		$(id).addClass(o.piece_shape+'_REDsquare').html(c);
		
		
	}
}

function fill_BLUE_repo_by_data(dataB) {
	console.log("repositoryB EFTASES EDW");
	console.log(dataB);
	repositoryR=dataB;
	for(var i=1;i<dataB.length+1;i++) {

		var o = dataB[i-1];
		var id = '#BLUEsquare_'+i;
		var c = (o.val!='W')?o.piece_shape :'';
		$(id).addClass(o.piece_shape+'_BLUEsquare').html(c);
	}
	
}

function check_repo_by_data(dataAll) {
	console.log("checking EFTASES EDW , kalestike diladi i check repo by data kai parakatw emfanizei to repository pou zitises");
	console.log(dataAll);
	repo=dataAll;
	ok=0;
	schm=getschm();
	var s = $('#the_move').val();
	var a = s.trim().split(/[ ]+/);
	for(var i=1;i<dataAll.length+1;i++) {
		var o = dataAll[i-1];
		if(o.val=='B'){
			console.log("kalase to B ");
		}else if(o.val=='R'){
            console.log("kalase to A ");
		}
		if(o.val=='W' && schm==o.piece_shape){
			ok=1;
			console.log("molis egine 1 to ok");
		}
	}
	console.log("To ok einai = ");
	console.log(ok);
	if(ok==1){
		console.log("Den uparxei sto repository to sxima auto");
		alert('Illegal move, '+schm+' has already been used!');
	}else{
		$.ajax({url: "blokus.php/board/piece/"+a[0]+'/'+a[1], 
		method: 'PUT',
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify( {x: a[2], y: a[3]}),
		headers: {"X-Token": me.token},
		success: move_result,
		error: login_error});
	}
}

function fill_check_by_data(dataB) {
	console.log("CHECK ----------------------------------------------------------------------------");
	console.log(dataB);

}






// class ParsedData {
// 	xA;
// 	yA;
// 	piece_color;
// 	piece_shape;

// 	constructor(xA, yA, piece_color, piece_shape) {
// 		this.xA = xA;
// 		this.yA = yA;
// 		this.piece_color = piece_color;
// 		this.piece_shape = piece_shape;
// 	}
// }


// const parsedData = JSON.parse(data);
	// const array = [];

	//  parsedData.forEach(element => {
	//  	array.push(new ParsedData(element.xA, element.yA, element.piece_color, element.piece_shape));
	//  });

	// for(var i=0;i<array.length;i++) {
	// 	var o = array[i];
	// 	var id = '#square_'+ o.xA +'_' + o.yA;
	// 	var c = (o.piece_shape!=null)?o.piece_color:'';
	// 	var pc= (o.piece_shape!=null)?'piece'+o.piece_color:'';
	// 	var im = (o.piece_shape!=null)?'<img class="piece" src="images/'+c+'.jpg">':'';
        
	// 	$(id).addClass(o.piece_color+'_square').html(im);	
	// }