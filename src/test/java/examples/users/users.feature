@dev
Feature: Open Google in the browser

  Background:
#    * configure driver = karate.read('classpath:resources/karate-config.js').driver



#    chromedriver_path: /Users/tanuj/Downloads/chromedriver_mac_arm64
#    chromedriver_path: /Users/tanuj/Downloads/chromedriver_mac64
#    chromedriver_path: /Applications/Google\ Chrome
#    * configure driver = { type: 'chrome', start: true, show: true, path: '#(chromedriver_path)' }
    * configure driver = {type: 'chrome', headless: true,path: '/usr/bin/chromedriver', addOptions: ['--headless=new', '--enable-automation']}

  Scenario: Open Google and take a screenshot
    Given driver 'https://www.bing.com'
    And screenshot()



