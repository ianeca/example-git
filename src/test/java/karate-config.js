function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    host: 'https://reqres.in/'
  }
  if (env == 'dev') {
    // customize
    url: "dev.qateam.com"
    // e.g. config.foo = 'bar';
  } else if (env == 'qa') {
    // customize
    url: "dev.qateam.com"
  }
  return config;
}