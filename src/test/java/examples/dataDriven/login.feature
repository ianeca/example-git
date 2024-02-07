Feature: Caso de Login

  @login
  Scenario: caso exitoso
    Given url host
    And path '/api/login'
    And request {"email": #(correo) , "password" : #(pass)}
    When method post
    Then status 200
    * print response
    * def authToken = response.token


  Scenario Outline: caso exitoso outline
    Given url host
    And path '/api/login'
    And request {"email": <correo> , "password" : <pass>}
    When method post
    Then status 200
    * print response

    Examples:
      | correo        | pass  |
      | abc@gmail.com | 12345 |