searchAtmsByCity() => '''
mutation SearchAtmsByCity(\$city: CitySearchRequest!) {
  action: searchAtmsByCity(citySearchRequest: \$city) {
    id
    name
    city
    postalAddress
    telephone
    email
    fax
    longitude
    latitude
  }
}''';


authenticateUserQuery() => '''
mutation LoginUser(\$auth: AuthRequest!){
  login(authRequest: \$auth){
    loginResponse,
    isAgent,
    customerId
    customerName
    mobile
  }
}''';
