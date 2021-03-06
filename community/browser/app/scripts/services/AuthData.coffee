###!
Copyright (c) 2002-2014 "Neo Technology,"
Network Engine for Objects in Lund AB [http://neotechnology.com]

This file is part of Neo4j.

Neo4j is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###

'use strict';

angular.module('neo4jApp.services')
.service 'AuthDataService', [
  'localStorageService'
  '$base64'
  (localStorageService, $base64) ->
    cached_authorization_data = localStorageService.get('authorization_data') || ''
    @setAuthData = (authdata) ->
      return unless authdata
      encoded = $base64.encode(authdata)
      cached_authorization_data = encoded
      localStorageService.set('authorization_data', encoded)
    @clearAuthData = ->
      localStorageService.remove('authorization_data')
      cached_authorization_data = null
    @getAuthData = ->
      return cached_authorization_data || localStorageService.get('authorization_data') || ''
    @getPlainAuthData = ->
      data = (cached_authorization_data || localStorageService.get('authorization_data'))
      if data then $base64.decode(data) else ''
    @
]
