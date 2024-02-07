Feature: Ejercicios DataDriven

  Background:
    * def responseLogin = call read('login.feature@login') {correo:"eve.holt@reqres.in", pass: "cityslicka"}
    * print responseLogin.authToken
    * header Authorization = responseLogin.authToken
    * url host
  Scenario: Listado de Usuarios
    Given path '/api/users'
    When method get
    Then status 200

  Scenario: Crear usuario
    Given path '/api/users'
    And request {"name": "Carlos" , "job" : "QA"}
    When method post
    Then status 201

  Scenario Outline: Crear usuario csv - <name>
    Given path '/api/users'
    And request {"name": <name> , "job" : <job>}
    When method post
    Then status 201

  Examples:
    | read('classpath:examples/dataDriven/dataUser.csv')|

  @setup
  Scenario: data
    * def data = read('classpath:examples/dataDriven/data.json')

  Scenario Outline: Crear usuario JSON - <name>
    Given path '/api/users/' + <id>
    When method GET
    Then status 200

    Examples:
      | karate.setup().data|

  Scenario Outline: Crear usuario JSON simple - <name>
    Given path '/api/users/' + <id>
    When method GET
    Then status 200

    Examples:
      | read('classpath:examples/dataDriven/data.json')|

  Scenario: Crear usuario dinamico - <name>
    Given path '/api/users/'
    And request read('boduUserDinamico.json') {nombre:"Alejandro, profesion:"QA"}
    When method post
    Then status 201

  Scenario: Crear usuario 2
    Given path '/api/users'
    And request {"name": "Carlos" , "job" : "QA"}
    When method post
    Then status 201
    And match response == {id: #string , name: #string, job:#string, createdAt: #string}
    And match $.name == "Carlos"







