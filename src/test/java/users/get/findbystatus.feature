Feature: Listar nombres de mascotas vendidas en Petstore

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Recoger mascotas vendidas y listar sus nombres
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200

    * def mascotasVendidas = response

    * def obtenerNombresId =
      """
      function(mascotas) {
        var nombresId = [];
        for (var i = 0; i < mascotas.length; i++) {
          nombresId.push({ id: mascotas[i].id, name: mascotas[i].name });
        }
        return nombresId;
      }
      """

    * def nombresId = call obtenerNombresId mascotasVendidas

    * print 'Nombres de mascotas vendidas (tupla id y name):', nombresId