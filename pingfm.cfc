<cfcomponent output="false">

	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="api_key" type="string" required="true">
		<cfargument name="user_app_key" type="string" required="true">
		
		<cfset variables.api_key = arguments.api_key>
		<cfset variables.user_app_key = arguments.user_app_key>
		
		<cfreturn this>
	</cffunction>

	<cffunction name="sendRawRequest" access="private" returntype="any" output="false">
		<cfargument name="resource" type="string" required="true">
		<cfargument name="params" type="struct" required="true">

		<cfset var key = "">
		<cfset var queryString = "">
		<cfset var response = "">

		<cfhttp 
			url="http://api.ping.fm/#arguments.resource#"
			useragent="TweetSurge"
			method="post"
			timeout="5">
			
			<cfloop collection="#arguments.params#" item="key">
				<cfif structKeyExists(arguments.params,key)>
					<cfhttpparam name="#lCase(key)#" value="#arguments.params[key]#" type="formfield">
				</cfif>
			</cfloop>
		</cfhttp>

		<cfset response = duplicate(cfhttp)>
		<cfset response.url = "http://api.ping.fm/#arguments.resource#">
		<cfreturn response>
	</cffunction>

	<cffunction name="system_services" access="public" returntype="any" output="false">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/system.services",arguments)>
	</cffunction>

	<cffunction name="user_key" access="public" returntype="any" output="false">
		<cfargument name="mobile_key" type="string" required="true">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/user.key",arguments)>
	</cffunction>

	<cffunction name="user_validate" access="public" returntype="any" output="false">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/user.validate",arguments)>
	</cffunction>

	<cffunction name="user_services" access="public" returntype="any" output="false">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/user.services",arguments)>
	</cffunction>

	<cffunction name="user_triggers" access="public" returntype="any" output="false">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/user.triggers",arguments)>
	</cffunction>

	<cffunction name="user_latest" access="public" returntype="any" output="false">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/user.latest",arguments)>
	</cffunction>

	<cffunction name="user_post" access="public" returntype="any" output="false">
		<cfargument name="body" type="string" required="true">
		<cfargument name="location" type="string" required="false">
		<cfargument name="post_method" type="string" required="true" default="default">
		<cfargument name="api_key" type="string" required="true" default="#variables.api_key#">
		<cfargument name="user_app_key" type="string" required="true" default="#variables.user_app_key#">
				
		<cfreturn sendRawRequest("v1/user.post",arguments)>
	</cffunction>

</cfcomponent>
