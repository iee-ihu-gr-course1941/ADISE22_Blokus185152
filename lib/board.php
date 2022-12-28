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

function move_piece($clr,$shape,$x2,$y2,$token) {

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
	}else{
	    if ($color==$clr){ 
				$lst =add_valid_moves_to_piece($shape);
				$okfuture=check_future_positions($clr,$lst,$x2,$y2,$shape);
				//$okcorrent=check_corrent_positions($clr,$x2,$y2);
				$okcorrent=0;
				if($okfuture==0&&$okcorrent==0){
					foreach($lst as list($a,$b)){
						do_move($clr,$shape,$x2+$a,$y2+$b);
					}
				}else{
					header("HTTP/1.1 400 Bad Request");
					print json_encode(['errormesg'=>"This move is illegal."]);
					exit;
				}	
			
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

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}

function read_repositoryR($schm) {
	global $mysqli;
	$sql = 'select val from red_repository where piece_shape=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$schm);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

function show_repositoryB(){
	
	global $mysqli;
	
	$sql = 'select * from blue_repository';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}

function read_repositoryB($schm2) {
	global $mysqli;
	$sql = 'select val from blue_repository where piece_shape=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$schm2);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

// function checksALL(){
//     global $mysqli;

//     $sql = 'call full_repositoriesR()';
//     $mysqli->query($sql);

// 	show_repositoryR();
	
// }


function reset_board(){
    global $mysqli;

    $sql = 'call clean_board()';
    $mysqli->query($sql);

    show_board();
}

function reset_repositoryR(){
    global $mysqli;

    $sql = 'call full_repositoriesR()';
    $mysqli->query($sql);

	show_repositoryR();
	
}

function reset_repositoryB(){
    global $mysqli;

    $sql = 'call full_repositoriesB()';
    $mysqli->query($sql);

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

function convert_repo(&$orig_board) {
	$repo=[];
	foreach($orig_board as $i=>&$row) {
		$repo[$row['piece_shape']][$row['val']] = &$row;
	} 
	return($repo);
}


function show_board_by_player($b) {

	global $mysqli;

	$orig_board=read_board();
	$board=convert_board($orig_board);
	$status = read_status();
	// if($status['status']=='started' && $status['p_turn']==$b && $b!=null) {
	// 	// It my turn !!!!
	// 	$n = add_valid_moves_to_board($board,$b);
		
	// 	// Εάν n==0, τότε έχασα !!!!!
	// 	// Θα πρέπει να ενημερωθεί το game_status.
	// }
	header('Content-type: application/json');
	print json_encode($orig_board, JSON_PRETTY_PRINT);
}

function add_valid_moves_to_board(&$board,$b) {
	$number_of_moves=0;
	
	for($x=1;$x<21;$x++) {
		for($y=1;$y<21;$y++) {
			$number_of_moves+=add_valid_moves_to_piece($board,$b,$x,$y);
		}
	}
	return($number_of_moves);
}










function add_valid_moves_to_piece($shape) {
		switch($shape){
			case 'A': $direction=A_moves();break;
			case 'B': $direction=B_moves();break;
			case 'C': $direction=C_moves();break;
			case 'D': $direction=D_moves();break;
			case 'E': $direction=E_moves();break;
			case 'F': $direction=F_moves();break;
			case 'G': $direction=G_moves();break;
			case 'H': $direction=H_moves();break;
			case 'I': $direction=I_moves();break;
			case 'J': $direction=J_moves();break;
			case 'K': $direction=K_moves();break;
			case 'L': $direction=L_moves();break;
			case 'M': $direction=M_moves();break;
			case 'N': $direction=N_moves();break;
			case 'O': $direction=O_moves();break;
			case 'P': $direction=P_moves();break;
			case 'Q': $direction=Q_moves();break;
			case 'R': $direction=R_moves();break;
			case 'S': $direction=S_moves();break;
			case 'T': $direction=T_moves();break;
			case 'U': $direction=U_moves();break;
		}
	return($direction);
}

//na tsekarei an to sxima uparxei sto table repository
// apagoreuetai na ena koutaki na exei to idio xrwma kai diaforetiko sxima apo panw katw deksia kai aristera tou diladi
//[0,+1],[+1,0],[0,-1],[-1,0]
//episis tha pareis to megethos tou pioniou kai analoga tis epanalipseis tha eksetazeis kathe periptwsi an se ekeino to simeio uparxei pioni me diaforetiko xrwma



//CHECK an uparxei to sxima red kathigiti   [{"val":"R"}]

function Exist($clr,$sch){
	$ok=1;
	if($clr=='R'){
		$repo=read_repositoryR($sch);
		$kpop='W';
	}else if($clr=='B'){
		$repo=read_repositoryB($sch);
		$kpop='B';
	}
	foreach($repo as list($a)){
		if($a==$clr){
			$ok=0;
		}
	}
	return ($ok);
}

function check_future_positions($clr,$lst,$x2,$y2,$shape){
	$ok=0;
	$orig_board=read_board();
	$board=convert_board($orig_board);
	foreach($lst as list($a,$b)){
		if(($x2+$a)>=1&&($x2+$a)<=20&&($y2+$b)>=1&&($y2+$b)<=20&&$board[$x2+$a][$y2+$b]['piece_color'] =='W'){
			if(($x2+$a+1)>=1&&($x2+$a+1)<=20&&($y2+$b)>=1&&($y2+$b)<=20){
				if($board[$x2+$a+1][$y2+$b]['piece_color'] !=$clr || ($board[$x2+$a+1][$y2+$b]['piece_color']==$clr && $board[$x2+$a+1][$y2+$b]['piece_shape'] ==$shape)){
                    $nai=1;
				}else{
					$ok=1;
				}
			}
			if(($x2+$a-1)>=1&&($x2+$a-1)<=20&&($y2+$b)>=1&&($y2+$b)<=20){
				if(($board[$x2+$a-1][$y2+$b]['piece_color'] !=$clr || ($board[$x2+$a-1][$y2+$b]['piece_color']==$clr && $board[$x2+$a-1][$y2+$b]['piece_shape'] ==$shape))){
                    $nai=1;
				}else{
					$ok=1;
				}
			}
			if(($x2+$a)>=1&&($x2+$a)<=20&&($y2+$b+1)>=1&&($y2+$b+1)<=20){
				if(($board[$x2+$a][$y2+$b+1]['piece_color'] !=$clr || ($board[$x2+$a][$y2+$b+1]['piece_color']==$clr && $board[$x2+$a][$y2+$b+1]['piece_shape'] ==$shape))){
                    $nai=1;
				}else{
					$ok=1;
				}
			}
			if(($x2+$a)>=1&&($x2+$a)<=20&&($y2+$b+1)>=1&&($y2+$b+1)<=20){
				if(($board[$x2+$a][$y2+$b-1]['piece_color'] !=$clr || ($board[$x2+$a][$y2+$b-1]['piece_color']==$clr && $board[$x2+$a][$y2+$b-1]['piece_shape'] ==$shape))){
                    $nai=1;
				}else{
					$ok=1;
				}
			}
		}else{
			$ok=1;
		} 
	}
	return ($ok);
}


function check_corrent_positions($clr,$x2,$y2,){
	$ok=1;
	$orig_board=read_board();
	$board=convert_board($orig_board);
	if($clr=='R' && $x2==5 && $y2==5 ){
		$ok=0;
	}
	if($clr=='B' && $x2==15 && $y2==15 ){
		$ok=0;
	}
    if($board[$x2+1][$y2+1]['piece_color']==$clr){
		$ok=0;
	}
	if($board[$x2-1][$y2-1]['piece_color']==$clr){
		$ok=0;
	}
	if($board[$x2+1][$y2-1]['piece_color']==$clr){
		$ok=0;
	}
	if($board[$x2-1][$y2+1]['piece_color']==$clr){
		$ok=0;
	}
	
	return ($ok);
}




function A_moves() {
	$directions = [
		[0,0]
	];

	return($directions);
}
function B_moves() {
	$directions = [
		[0,0],[0,1]
	];

	return($directions);
}

function C_moves() {
	$directions = [
		[0,0], [0,1], [0,-1]
	];

	return($directions);
}
function D_moves() {
	$directions = [
		[0,0], [1,0], [0,-1]
	];

	return($directions);
}
function E_moves() {
	$directions = [
		[0,0], [0,1], [0,2], [0,-1]
	];

	return($directions);
}
function F_moves() {
	$directions = [
		[0,0], [0,-1], [0,1], [-1,1]
	];

	return($directions);
}
function G_moves() {
	$directions = [
		[0,0], [1,0], [0,1], [0,-1]
	];

	return($directions);
}
function H_moves() {
	$directions = [
		[0,0], [1,0], [0,1], [1,1]
	];

	return($directions);
}
function I_moves() {
	$directions = [
		[-1,0], [0,0], [0,1], [1,1]
	];

	return($directions);
}
function J_moves() {
	$directions = [
		[0,0], [0,1], [0,2], [0,-1], [0,-2]
	];

	return($directions);
}
function K_moves() {
	$directions = [
		[0,0], [0,1], [0,-2], [0,-1], [-1,1]
	];

	return($directions);
}
function L_moves() {
	$directions = [
		[0,-2], [0,-1], [0,0], [-1,0], [-1,1]
	];

	return($directions);
}
function M_moves() {
	$directions = [
		[0,-1], [-1,0], [0,0], [-1,1], [0,1]
	];

	return($directions);
}
function N_moves() {
	$directions = [
		[0,0], [0,1], [-1,1], [0,-1], [-1,-1]
	];

	return($directions);
}
function O_moves() {
	$directions = [
		[0,-1], [0,0], [1,0], [0,1], [0,2]
	];

	return($directions);
}
function P_moves() {
	$directions = [
		[0,0], [0,-1], [0,1], [-1,1], [1,1]
	];

	return($directions);
}
function Q_moves() {
	$directions = [
		[0,0], [1,0], [2,0], [0,-1], [0,-2]
	];

	return($directions);
}
function R_moves() {
	$directions = [
		[0,0], [1,0], [1,1], [0,-1], [-1,-1]
	];

	return($directions);
}
function S_moves() {
	$directions = [
		[0,0], [1,0], [1,1], [-1,0], [-1,-1]
	];

	return($directions);
}
function T_moves() {
	$directions = [
		[-1,-1], [-1,0], [0,0], [1,0], [0,1]
	];

	return($directions);
}
function U_moves() {
	$directions = [
		[0,0], [1,0], [0,1], [-1,0], [0,-1]
	];

	return($directions);
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



function do_move($clr,$shape,$x2,$y2) {
	global $mysqli;
	$sql = 'call move_piece(?,?,?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ssii',$clr,$shape,$x2,$y2 );
	$st->execute();

	header('Content-type: application/json');
	print json_encode(read_board(), JSON_PRETTY_PRINT);
}



?>