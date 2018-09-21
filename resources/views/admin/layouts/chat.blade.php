<!DOCTYPE html>
<html>
<head>
	<title>chat room</title>
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<link rel="stylesheet" href="{{asset('css/app.css')}}" />
</head>
<body> 
	<div class="container">
		<div class="row" id="app">
			<ul class="list-group offset-4 col-4">
				<li class="list-group-item active">Chat Room</li>
				<li class="list-group-item">Dapibus ac facilisis in</li>
				<li class="list-group-item">Morbi leo risus</li>
				<li class="list-group-item">Porta ac consectetur ac</li>
				<li class="list-group-item">Vestibulum at eros</li>

				<div class="chat-message well">
                	
                	<span class="input-box">
                		<input type="text" name="" class="form-control" placeholder="Type your message here...!" v-model='message'>
                		<button class="btn btn-success float-right">Send</button>
                	</span> 
              </div>
			</ul>		
		</div>
	</div>
	<script src="{{asset('js/app.js')}}"></script>
</body>
</html>