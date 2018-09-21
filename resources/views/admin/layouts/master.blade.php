<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="csrf-token" content="<?= csrf_token() ?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="{{asset('backend/css/bootstrap.min.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/bootstrap-responsive.min.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/sweetalert.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/uniform.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/select2.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/fullcalendar.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/matrix-style.css')}}" />
<link rel="stylesheet" href="{{asset('backend/css/matrix-media.css')}}" />
<link href="{{asset('backend/font-awesome/css/font-awesome.css')}}" rel="stylesheet" />
<link rel="stylesheet" href="{{asset('backend/css/jquery.gritter.css')}}" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="{{URL::to('backend/img/favicon.ico')}}">
</head>
<body>

<!--Header-part-->

<!--close-Header-part--> 

    @include('admin.layouts.header')

<!--top-Header-menu-->

<!--close-top-Header-menu-->
<!--start-top-serch-->

<!--close-top-serch-->
<!--sidebar-menu-->
    @include('admin.layouts.sidebar')
<!--sidebar-menu-->

<!--main-container-part-->
    @yield('content')
<!--end-main-container-part-->

<!--Footer-part-->

    @include('admin.layouts.footer')

<!--end-Footer-part-->

 

<script src="{{asset('backend/js/jquery.min.js')}}"></script> 
<script src="{{asset('backend/js/jquery.ui.custom.js')}}"></script> 
<script src="{{asset('backend/js/bootstrap.min.js')}}"></script> 
<script src="{{asset('backend/js/jquery.uniform.js')}}"></script> 
<script src="{{asset('backend/js/select2.min.js')}}"></script>
<script src="{{asset('backend/js/jquery.dataTables.min.js')}}"></script> 
<script src="{{asset('backend/js/jquery.validate.js')}}"></script> 
<script src="{{asset('backend/js/matrix.js')}}"></script> 
<script src="{{asset('backend/js/matrix.form_validation.js')}}"></script>
<script src="{{asset('backend/js/matrix.tables.js')}}"></script>
<script src="{{asset('backend/js/matrix.popover.js')}}"></script>
<script src="{{asset('backend/js/sweetalert.min.js')}}"></script>
</body>
</html>
