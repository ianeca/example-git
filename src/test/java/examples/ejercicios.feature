Feature: Ejercicios clase 4
  Scenario: Caso 1
    * def id = 100
    Given url 'https://jsonplaceholder.typicode.com/'
    And path '/posts/' + id
    When method get
    Then status 200
    And match responseType == 'xml'
    And match $.id ==10

  Scenario: Caso 2
    Given url 'https://reqres.in/'
    And path '/api/users'
    And param page = 2
    When method get
    Then status 200
    And match responseType == 'json'
    * print response.data[2].id
    And match response.data[2].id == 9

  Scenario: Caso 3
    Given url 'https://reqres.in/'
    And path '/api/users'
    And request {"name": "morpheus","job": "leader" }
    When method post
    Then status 201
    And match response.name == 'morpheus'
    And match response.job == 'leader'

  Scenario: Caso 3
    * def body =
    """
    {
      "name": "morpheus",
      "job": "leader"
    }"""
    Given url 'https://reqres.in/'
    And path '/api/users'
    And request {"name": "morpheus","job": "leader" }
    When method post
    Then status 201
    And match response.name == 'morpheus'
    And match response.job == 'leader'
Scenario: Caso 5 - crear usuario con docString en variable
  * print read("bodyuser.json")
  Given url 'https://reqres.in/'
  And path '/api/users'
  And request read("bodyuser.json")
  When method post
  Then status 201
  And match response.name == 'morpheus'
  And match response.job == 'leader'

Scenario: Caso 6 - Login
  Given url 'https://reqres.in/'
  And path '/api/login'
  And form field email = 'eve.holt@reqres.in'
  And form field password = 'cityslicka'
  When method post
  Then status 200
  And match responde.token == "#notnnull"

  Scenario: Caso 7 - actualizar
    * def id = 2
    Given url 'https://reqres.in/'
    And path '/api/users/' + id
    And request read("bodyuser.json")
    When method put
    Then status 200
    * print response
    And match $.name == "morpheus"
    And match $.job == "zion resident"
    And match $.updatedAt ==  "#notnnull"


  Scenario: Caso 8 - login unsuccenfull
    Given url 'https://reqres.in/'
    And path '/api/login'
    And form field email = 'peter@klaven'
    When method post
    Then status 400
    And match response.error == "Missing password"

  Scenario: Caso 9 - DELETE
    * def id = 2
    Given url 'https://reqres.in/'
    And path '/api/users/' + id
    When method delete
    Then status 204












