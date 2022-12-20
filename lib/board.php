<?php
function show_piece($x,$y) {
	global $mysqli;
	
	$sql = 'select * from board where x=? and y=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$x,$y);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function move_piece($x,$y,$x2,$y2,$token) {
	
	if($token==null || $token=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"token is not set."]);
		exit;
	}
	
	$color = current_color($token);
	if($color==null ) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"You are not a player of this game."]);
		exit;
	}
	$status = read_status();
	if($status['status']!='started') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Game is not in action."]);
		exit;
	}
	if($status['p_turn']!=$color) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"It is not your turn."]);
		exit;
	}
	$orig_board=read_board();
	$board=convert_board($orig_board);
	$n = add_valid_moves_to_piece($board,$color,$x,$y);
	if($n==0) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"This piece cannot move."]);
		exit;
	}
	foreach($board[$x][$y]['moves'] as $i=>$move) {
		if($x2==$move['x'] && $y2==$move['y']) {
			do_move($x,$y,$x2,$y2);
			exit;
		}
	}
	header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"This move is illegal."]);
	exit;
}

function show_board() {
	
	global $mysqli;
	
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}


function show_repositoryR(){
    global $mysqli;

    $sql = 'select * from red_repository';
    $st = $mysqli->prepare($sql);

    $st->execute();
    $res = $st->get_result();

    header('Content_type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function show_repositoryB(){
    global $mysqli;

    $sql = 'select * from blue_repository';
    $st = $mysqli->prepare($sql);

    $st->execute();
    $res = $st->get_result();

    header('Content_type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_board(){
    global $mysqli;

    $sql = 'call clean_board()';
    $mysqli->query($sql);

    show_board();
}

function reset_repository(){
    global $mysqli;

    $sql = 'call full_repositories()';
    $mysqli->query($sql);

	show_repositoryR();
    show_repositoryB();
	
}

function read_board() {
	global $mysqli;
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

function convert_board(&$orig_board) {
	$board=[];
	foreach($orig_board as $i=>&$row) {
		$board[$row['xA']][$row['yA']] = &$row;
	} 
	return($board);
}


function show_board_by_player($b) {

	global $mysqli;

	$orig_board=read_board();
	$board=convert_board($orig_board);
	$status = read_status();
	if($status['status']=='started' && $status['p_turn']==$b && $b!=null) {
		// It my turn !!!!
		$n = add_valid_moves_to_board($board,$b);
		
		// Εάν n==0, τότε έχασα !!!!!
		// Θα πρέπει να ενημερωθεί το game_status.
	}
	header('Content-type: application/json');
	print json_encode($orig_board, JSON_PRETTY_PRINT);
}


function add_valid_moves_to_piece(&$board,$b,$x,$y) {
	$number_of_moves=0;
	if($board[$x][$y]['piece_color']==$b) {
		switch($board[$x][$y]['piece_shape']){
			case 'A': $number_of_moves+=A_moves($board,$b,$x,$y);break;
			case 'B': $number_of_moves+=B_moves($board,$b,$x,$y);break;
			case 'C': $number_of_moves+=C_moves($board,$b,$x,$y);break;
			case 'D': $number_of_moves+=D_moves($board,$b,$x,$y);break;
			case 'E': $number_of_moves+=E_moves($board,$b,$x,$y);break;
			case 'F': $number_of_moves+=F_moves($board,$b,$x,$y);break;
			case 'G': $number_of_moves+=G_moves($board,$b,$x,$y);break;
			case 'H': $number_of_moves+=H_moves($board,$b,$x,$y);break;
			case 'I': $number_of_moves+=I_moves($board,$b,$x,$y);break;
			case 'J': $number_of_moves+=J_moves($board,$b,$x,$y);break;
			case 'K': $number_of_moves+=K_moves($board,$b,$x,$y);break;
			case 'L': $number_of_moves+=L_moves($board,$b,$x,$y);break;
			case 'M': $number_of_moves+=M_moves($board,$b,$x,$y);break;
			case 'N': $number_of_moves+=N_moves($board,$b,$x,$y);break;
			case 'O': $number_of_moves+=O_moves($board,$b,$x,$y);break;
			case 'P': $number_of_moves+=P_moves($board,$b,$x,$y);break;
			case 'Q': $number_of_moves+=Q_moves($board,$b,$x,$y);break;
			case 'R': $number_of_moves+=R_moves($board,$b,$x,$y);break;
			case 'S': $number_of_moves+=S_moves($board,$b,$x,$y);break;
			case 'T': $number_of_moves+=T_moves($board,$b,$x,$y);break;
			case 'U': $number_of_moves+=U_moves($board,$b,$x,$y);break;
		}
	} 
	return($number_of_moves);
}





function A_moves(&$board,$b,$x,$y) {
	$m = [
		[1,1],
		[1,-1], 
		[-1,1],
		[-1,-1],
	];
	$moves=[];
	foreach($m as $k=>$t) {
		$x2=$x+$t[0];
		$y2=$y+$t[1];
		if( $x2>=1 && $x2<20 && $y2>=1 && $y2<=20 &&
			$board[$x2][$y2]['piece_color'] !='R' && $board[$x2][$y2]['piece_color'] !='B') {
			// Αν ο προορισμός είναι εντός σκακιέρας και δεν υπάρχει χρωμα μπλε η κοκκινο
			$move=['xΑ'=>$x2, 'yΑ'=>$y2];
			$moves[]=$move;
		}
	}
	$board[$x][$y]['moves'] = $moves;
	return(sizeof($moves));
}

function B_moves(&$board,$b,$x,$y) {
	$direction=($b=='W')?1:-1;
	$moves=[];

	if($board[$x][$y+$direction]['piece_color']=='W' ) {
		$move=['x'=>$x, 'y'=>$y+$direction];
		$moves[]=$move;

	}
	$board[$x][$y]['moves'] = $moves;
	return(sizeof($moves));
}


// class BlokuSet
//   BLOKU_SET =
//       [
//        Bloku.new(0, 'u', [0,0], [1,0], [0,1], [-1,0], [0,-1]), # X5
//        Bloku.new(1, 't', [-1,-1], [-1,0], [0,0], [1,0], [0,1]), # F5
//        Bloku.new(2, 's', [0,0], [1,0], [1,1], [-1,0], [-1,-1]), # Z5
//        Bloku.new(3, 'r', [0,0], [1,0], [1,1], [0,-1], [-1,-1]), # W5
//        Bloku.new(4, 'q', [0,0], [1,0], [2,0], [0,-1], [0,-2]), # V5
//        Bloku.new(5, 'p', [0,0], [0,-1], [0,1], [-1,1], [1,1]), # T5
//        Bloku.new(6, 'o', [0,-1], [0,0], [1,0], [0,1], [0,2]), # Y5
//        Bloku.new(7, 'n', [0,0], [0,1], [-1,1], [0,-1], [-1,-1]), # C5
//        Bloku.new(8, 'm', [0,-1], [-1,0], [0,0], [-1,1], [0,1]), # P5
//        Bloku.new(9, 'l', [0,-2], [0,-1], [0,0], [-1,0], [-1,1]), # N5
//        Bloku.new(10, 'k', [0,0], [0,1], [0,-2], [0,-1], [-1,1]), # L5
//        Bloku.new(11, 'j', [0,0], [0,1], [0,2], [0,-1], [0,-2]), # I5

//        Bloku.new(12, 'i', [-1,0], [0,0], [0,1], [1,1]), # Z4
//        Bloku.new(13, 'h', [0,0], [1,0], [0,1], [1,1]), # O4
//        Bloku.new(14, 'g', [0,0], [1,0], [0,1], [0,-1]), # T4
//        Bloku.new(15, 'f', [0,0], [0,-1], [0,1], [-1,1]), # L4
//        Bloku.new(16, 'e', [0,0], [0,1], [0,2], [0,-1]), # I4

//        Bloku.new(17, 'd', [0,0], [1,0], [0,-1]), # L3
//        Bloku.new(18, 'c', [0,0], [0,1], [0,-1]), # I3

//        Bloku.new(19, 'b', [0,0], [0,1]), # I2
//        Bloku.new(20, 'a', [0,0]), # I1
//       ]
// }








function do_move($x,$y,$x2,$y2) {
	global $mysqli;
	$sql = 'call `move_piece`(?,?,?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('iiii',$x,$y,$x2,$y2 );
	$st->execute();

	header('Content-type: application/json');
	print json_encode(read_board(), JSON_PRETTY_PRINT);
}



?>