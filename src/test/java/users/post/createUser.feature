Feature: Ejemplo de creación

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Crear un usuario
    Given path '/user'
    And request
    """
    {
      "id": 11,
      "username": "maria",
      "firstName": "maria",
      "lastName": "alex",
      "email": "maria@correo.com",
      "password": "123456",
      "phone": "123456789"
    }
    """
    When method post
    Then status 200