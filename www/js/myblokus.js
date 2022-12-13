$(function () {
	draw_empty_board();
    fill_board();
    $('blokus_reset').click(reset_board);
});

function draw_empty_board() {
	var t='<table id="blokus_table">';
	for(var i=20;i>0;i--) {
		t += '<tr>';
		for(var j=1;j<21;j++) {
			t += '<td class="blokus_square" id="square_'+j+'_'+i+'">' + j +','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	$('#blokus_board').html(t);
}

function fill_board() {
	$.ajax(
        {url: "blokus.php/board/",
        success: fill_board_by_data }
        );
	
}


function reset_board() {
	$.ajax(
        {url: "blokus.php/board/",
        method:'post',  
        success: fill_board_by_data }
        );
	
}

function fill_board_by_data(data) {
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.xA +'_' + o.yA;
		var c = (o.piece_shape!=null)?o.piece_color + piece_shape:'';
		var pc= (o.piece_shape!=null)?'piece'+o.piece_color:'';
		var im = (o.piece_shape!=null)?'<img class="piece" src="images/'+c+'.png">':'';
		$(id).addClass(o.piece_color+'_square').html(im);
	}
 
}