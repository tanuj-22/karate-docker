function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    browser: 'chrome',
    executablePath: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    type: 'chrome',
    headless: true,
    baseURL: 'https://www.google.com',

  }

  // log driver config
    karate.log('driver config is:', karate.config);
  return config;
}