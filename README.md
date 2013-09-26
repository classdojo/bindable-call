Makes it easy to bind asynchronous function calls. For example:

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
