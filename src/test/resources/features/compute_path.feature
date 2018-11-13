Feature: TSP path finder feature

  Background: truncate the db and connections
    And create 'cities' table for other tests if not exist
    And Empty Table 'cities'

  Scenario: retrieve a list of cities within the UK
    Given appropriate city data is inserted
      | name        | lat_long         |
      | london      | 51.5074, 0.1278  |
      | paris       | 48.8566, 2.3522  |
      | edinburgh   | 55.9533, 3.1883  |
      | swansea     | 51.6214, 3.9436  |
    When send a get cities request with a country parameter "UK"
    Then http status code should be '200' : query test
    And returns a list of UK cities with it's coordinates
      | name        | lat_long         |
      | london      | 51.5074, 0.1278  |
      | edinburgh   | 55.9533, 3.1883  |
      | swansea     | 51.6214, 3.9436  |

  Scenario: find a hamiltonian path, traversing cities within the UK
    Given appropriate city data is inserted
      | name        | lat_long         |
      | london      | 51.5074, 0.1278  |
      | paris       | 48.8566, 2.3522  |
      | edinburgh   | 55.9533, 3.1883  |
      | swansea     | 51.6214, 3.9436  |
    When send a 'find a path' request with a country parameter "UK" and algorithm "2-opt"
    Then http status code should be '200' : query test
    And returns a list of UK cities with it's coordinates (these mean a path)
      | name        | lat_long         |
      | london      | 51.5074, 0.1278  |
      | swansea     | 55.9533, 3.1883  |
      | edinburgh   | 51.6214, 3.9436  |