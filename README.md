Makes it easy to bind asynchronous function calls.


## Example

```javascript

var bindableRequest = require("bindable-request"),
username = "user",
password = "password";

var loginRequest = bindableRequest(function(next) {
  login(username, password, next);
});



loginRequest.bind("loading").once().to(function(loading) {
  
}).now();

loginRequest.bind("error").once().to(function(error) {
  console.log(error.message);
}).now();

loginRequest.bind("data").once().to(function(data) {
  console.log(data);
}).now();

loginRequest.bind("response").once().to(function(response) {
  console.log(response.error, response.data);
}).now();
```


## Mojo.js Example


login.coffee

```coffeescript
class LoginView extends mojo.View

  ###
  ###
  
  paper: require("./login.pc")
  
  ###
  ###
  
  bindings:
    "loginRequest.loading" : "loading"
    "loginRequest.error"   : "error"
  
  ###
  ###
  
  login: () ->
  
    @set "loginRequest", bindableRequest (next) =>
      mediator.execute "login", {
        username: @get("username"),
        password: @get("password")
      }, next
      
```

login.pc

```html


{{#if: loading }}
  loading...
{{/else}}

  {{#if: error }}
    {{ error.message }}
  {{/}}
  
  <input type="text" name="username" data-bind="{{ model: this }}"></input>
  <input type="text" name="password" data-bind="{{ model: this }}"></input>
{{/}}
```
