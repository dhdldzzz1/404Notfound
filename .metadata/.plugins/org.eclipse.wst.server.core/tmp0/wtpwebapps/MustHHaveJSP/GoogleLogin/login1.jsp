<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Google login #1</title>
	</head>
	<body>
		<script src="https://accounts.google.com/gsi/client" async></script>
		<!-- Json Web Token : 사용자 인증을 위해 사용하는 암호화된 토큰 -->
		<script src="https://cdn.jsdelivr.net/npm/jwt-decode@latest/build/jwt-decode.min.js"></script>
				
	    <script>
	      function handleCredentialResponse(response) {
			var responsePayload = jwt_decode(response.credential);
			console.log(responsePayload); // F12 눌러써 확인
			console.log("ID : " +  responsePayload.sub); // F12 눌러써 확인
			console.log("Full Name : " +  responsePayload.name);
			console.log("Given Name : " +  responsePayload.given_name);
			console.log("Image URL : " +  responsePayload.picture);
			console.log("Email : " +  responsePayload.email);
			
	      }
	      window.onload = function () {
	        google.accounts.id.initialize({
	          client_id: "1057212021687-j292betvi7jtu2vuueer1agft6l4v9e0.apps.googleusercontent.com",
	          callback: handleCredentialResponse
	        });
	        google.accounts.id.renderButton(
	          document.getElementById("buttonDiv"),
	          { theme: "outline", size: "large" }  // customization attributes
	        );
	        google.accounts.id.prompt(); // also display the One Tap dialog
	      }
	    </script>
	    <div id="buttonDiv"></div>
		
	</body>
</html>