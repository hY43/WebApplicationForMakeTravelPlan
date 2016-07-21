<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	(function() {
		var po = document.createElement('script');
		po.type = 'text/javascript';
		po.async = true;
		po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(po, s);
	})();

	function onLoadCallback() {
		gapi.client.setApiKey(''); //set your API KEY
		gapi.client.load('plus', 'v1', function() {
		});//Load Google + API
	}

	function login() {
		var myParams = {
			'clientid' : '869049109785-d7nokbciq3q3h9k0u58olbqe2di46cn7.apps.googleusercontent.com', //You need to set client id
			'cookiepolicy' : 'single_host_origin',
			'callback' : 'loginCallback', //callback function
			'approvalprompt' : 'force',
			'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
		};
		gapi.auth.signIn(myParams);
	}

	function loginCallback(result) {
		if (result['status']['signed_in']) {
			var request = gapi.client.plus.people.get({
				'userId' : 'me'
			});
			request.execute(function(resp) {
				var email = '';
				if (resp['emails']) {
					for (i = 0; i < resp['emails'].length; i++) {
						if (resp['emails'][i]['type'] == 'account') {
							email = resp['emails'][i]['value'];
						}
					}
				}

				var str = "Name:" + resp['displayName'] + "<br>";
				str += "Email:" + email + "<br>";
				document.getElementById("profile").innerHTML = str;

			});
		}
	}
</script>
</head>
<body>
</body>
</html>