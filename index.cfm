<!--- Register site with Google to get your sitekey and secret key --->
<!--- https://www.google.com/recaptcha/intro/index.html --->
<cfscript>
	captchabot.sitekey = ''; 
	captchabot.secretkey = '';
	
	
	//When a Form is Submitted add this is in the Action:
			if(structKeyExists('form', submit)) {

				CaptchaService = new http( );
				CaptchaService.setMethod( "post" );
				CaptchaService.setUrl( "https://www.google.com/recaptcha/api/siteverify" );
				CaptchaService.addParam( type = "formfield", name = "secret", value = "#rc.config.captcha.secretkey#" );
				CaptchaService.addParam( type = "formfield", name = "response", value = "#Form['g-recaptcha-response']#" );
				CaptchaService.addParam( type = "formfield", name = "remoteip", value = "#cgi.remote_addr#" );
				CaptchaPass = CaptchaService.send( ).getPrefix( );

				if( CaptchaPass.Filecontent contains 'true' ) {
					//Your Form Actions Go in Here
				}

			}
</cfscript>


<!--- Add this in between form tags 
<script src='https://www.google.com/recaptcha/api.js'></script>
<div class="g-recaptcha" data-sitekey="6Ldm1v4SAAAAALM1n9fcTWxqj9N1ngwuxp1v6eQu"></div>

--->



