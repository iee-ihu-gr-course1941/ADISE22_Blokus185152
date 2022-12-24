<?php

require_once "../lib/dbconnect.php";
require_once "../lib/board.php";
require_once "../lib/game.php";
require_once "../lib/users.php";


$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);

if($input==null) {
        $input=[];
        
}
if(isset($_SERVER['HTTP_X_TOKEN'])) {
        $input['token']=$_SERVER['HTTP_X_TOKEN'];
} else {
        $input['token']='';
}



switch ($r=array_shift($request)){
	case 'board' :
		switch ($b=array_shift($request)){
                	case '': 
                        case null: handle_board($method);
                                break;
                        case 'piece': 
                                handle_piece($method, $request[0],$request[1],$input);
                        	break;
                        default: header("HTTP/1.1 404 Not Found");
                                break;           
                        }
                break;
        case 'repository' :
                switch ($b=array_shift($request)){
                        case '': 
                        case 'R': handle_repoR($method);
                        break;
                        case 'B': handle_repoB($method);
                        break;
                        case 'checkrepo': handle_checks($method, $request[0],$input);
                        break;   
                        // case 'RR': handle_repoRR($method);
                        // break;
                        // case 'BR': handle_repoBR($method);
                        // break;
                        default: header("HTTP/1.1 404 Not Found");
                        break;           
                }
                break;        
        case 'status':
                if(sizeof($request)==0) {handle_status($method);}
		else {header("HTTP/1.1 404 Not Found");}
		break;
        case 'players':
                handle_player($method,$request,$input);
                break;     
        default: header("HTTP/1.1 404 Not Found");
                exit;
}



function handle_checks($method,$shape){
        if($method=='GET'){
                read_repositoryR($shape);
        }else{
                header('HTPP/1.1 405 Method Not Allowed');
        }
}



function handle_repoR($method){
        if($method=='GET'){
                show_repositoryR();
        }else if($method=='POST'){
                reset_repositoryR();
        }else{
                header('HTPP/1.1 405 Method Not Allowed');
        }
}




function handle_repoB($method){
        if($method=='GET'){
                show_repositoryB();
        }else if($method=='POST'){
                reset_repositoryB();
        }else{
                header('HTPP/1.1 405 Method Not Allowed');
        }
}


function handle_board($method){
        if($method=='GET'){
                show_board();
        }else if($method=='POST'){
                reset_board();            
        }else{
                header('HTPP/1.1 405 Method Not Allowed');
        }
}

function handle_piece($method,$clr,$shape,$input){
        if($method=='GET') {
                show_piece($clr,$shape);
        } else if ($method=='PUT') {
                move_piece($clr,$shape,$input['x'],$input['y'],  
                $input['token']);
        }
}

function handle_player($method,$p,$input){
        switch ($b=array_shift($p)) {
                //	case '':
                //	case null: if($method=='GET') {show_users($method);}
                //			   else {header("HTTP/1.1 400 Bad Request"); 
                //					 print json_encode(['errormesg'=>"Method $method not allowed here."]);}
                //                break;
                case 'B': 
                case 'R': handle_user($method, $b,$input);
                        break;
                default: header("HTTP/1.1 404 Not Found");
                        print json_encode(['errormesg'=>"Player $b not found."]);
                        break;
                }       
}

function handle_status($method){
        if($method=='GET'){
                show_status();
        }else{
                header('HTPP/1.1 405 Method Not Allowed');
        }
}

?>