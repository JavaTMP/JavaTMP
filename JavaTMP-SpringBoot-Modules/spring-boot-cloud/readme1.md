## Securing your microservices
- A realm is a concept that Keycloak uses to refer to an object that manages a set of users, credentials, roles, and groups.
- Clients in Keycloak are entities that can request user authentication.
- The clients are often the applications or services that we want to secure by providing a single sign-on (SSO) solution.
- The next step is to set up the client roles.
- we need to create the following client roles: USER, ADMIN
- See the client's credentials tab to get the secret text.
- The next step in our configuration is to create realm roles. The realm roles will allow us to have better control of what roles are being set for each user.
- create two types of realm roles: the ostock-user and the ostock-admin.
- Now that we’ve defined application-level and realm-level roles, names, and secrets,
  we’re ready to set up individual user credentials and the roles for
  the users. To create the users, let’s click the Users option shown in
  the left menu in Keycloak’s admin console.
-  we will define two user accounts: illary.huaylupo and john.carnell.
   The john.carnell account will have the role of ostock-user and
   the illary.huaylupo account will have the role of ostock-admin.
- Setting the user’s password and disabling the Temporary option for O-stock’s user’s credentials
- click the Realm Settings option in the left menu, and then click
  the OpenID Endpoint Configuration link to see a list of available 
  endpoints for our realm. 
- Selecting the OpenID Endpoint Configuration link for O-stock’s Keycloak spmia-realm
- Get We’ll do this by using Postman to POST to the endpoint 
  http://keycloak:8080/auth/realms/spmia-realm/protocol/openid-connect/token and 
  then provide the application, secret key, user ID, and password.
- we need to pass in the following information to the service as HTTP form parameters:
  - grant_type. The grant type to execute. In this example, we’ll use a password grant.
  - username. Name of the user logging in.
  - password. Password of the user logging in.
- When requesting an access token, the user’s credentials are passed in as HTTP form parameters to the /openid-connect/token endpoint.
- The authentication standard expects all parameters passed to the token generation endpoint to be HTTP form parameters.
- The JSON payload contains five attributes:
  access_token—The access token that will be presented with each service call the user makes to a protected resource.
  token_type—The authorization specification allows us to define multiple token types. The most common token type used is the Bearer Token. (We won’t cover any of the other token types in this chapter.)
  refresh_token—The refresh token can be presented back to the authorization server to reissue a token after it expires.
  expires_in—This is the number of seconds before the access token expires. The default value for authorization token expiration in Spring is 12 hours.
  scope—This defines the scope for which this access token is valid.
- Now that we have retrieved a valid access token from the authorization server,
  we can decode the JWT with https://jwt.io to retrieve all 
  the access token information. Figure 9.23 shows the results of
  the decoded JWT.
- Looking up user information based on the issued access token

