Feature: Cuenta Mascotas con el mismo nombre

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def PetsCounter = Java.type('src.PetsCounter')

  Scenario: Cuenta Mascotas con el mismo nombre
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    * def mascotasVendidas = response
    * def obtenerNombres =
      """
      function(mascotas) {
        var nombres = [];
        for (var i = 0; i < mascotas.length; i++) {
          nombres.push({ name: mascotas[i].name });
        }
        return nombres;
      }
      """
    * def responseNombres = call obtenerNombres mascotasVendidas
    * print 'Nombres de mascotas):', responseNombres
    * def nameToCount = 'doggie'
    * def count = karate.callSingle('classpath:src.PetsCounter.countPetsWithSameName', nameToCount, responseNombres)
    * print 'Número de mascotas :', count
    * assert count == 10
