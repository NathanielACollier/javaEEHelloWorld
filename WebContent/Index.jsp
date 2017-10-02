<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://unpkg.com/angular@1.6.6/angular.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!--  IBM i dev server link:
	http://zeus:10909/InvoiceApproval/Index.jsp
	 -->
<% Date d = new Date(); %>

<h1>
	Today's date is <%= d.toString() %> and this jsp page worked!
</h1>

<div>
	Java version is <%= System.getProperty("java.version") %>
</div>

<my-app></my-app>


<script type="text/javascript">
	var appName = "helloWorldApp";
	var app = angular.module(appName,[]);
	
	// general service
	var generalServiceName = "$general";
	app.service(generalServiceName, ["$http",function($http){
		var vm = this;
		vm.apiRoot = "api/general/";
		
		vm.getHello = function(){
			return $http.get(vm.apiRoot + "hello", {cache:false})
				.then(function(response){
					return response.data.Val; // look at RestString (Find better way some day)
				});
		};
	}]);
	
	var myAppComponent = "myApp";
	app.component(myAppComponent, {
		controller: [generalServiceName, function($general){
			var vm = this;
			vm.$onInit = function(){
				$general.getHello().then(function(message){
					vm.result = message;
				});
			};
		}],
		controllerAs: 'vm',
		template: "<div>{{vm.result}}</div>"
	});
	
	// bootstrap
	angular.element(document).ready(function() {
	    angular.bootstrap(document, [appName]);
	});
</script>

</body>
</html>