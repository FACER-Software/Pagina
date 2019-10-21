var output = document.getElementById('map')
var latitude = '';
var longitude = '';
document.getElementById('iniciarViaje').addEventListener('click', (event) =>{
    event.preventDefault
})

if (navigator.geolocation) {
    console.log('Tu navegador soporta geolocation')
}
else {
    console.log('Tu navegador no soporta geolocation')
}

//obtenemos latitud y longitud
function localizacion(posicion) {
    latitude = posicion.coords.latitude;
    longitude = posicion.coords.longitude;
}

function error() {
    console.log('No se pudo sacar posición')
}

navigator.geolocation.getCurrentPosition(localizacion, error)


function initMap() {
    
        
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
            center: {
                lat: latitude,
                lng: longitude
            },
            disableDefaultUI: true,
            zoomControl: true,
            scrollwheel: false,
            maxZoom: 17,
            minZoom: 10,
        });
        
        directionsDisplay.setMap(map);

        var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };
        document.getElementById('puntoF').addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
          var destino
            if(document.getElementById('puntoF').value == 'CECyT1'){
                destino = {
                    lat: 19.466909, 
                    lng: -99.090682
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT2'){
                destino = {
                    lat: 19.452222, 
                    lng: -99.213178
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT3'){
                destino = {
                    lat: 19.571034, 
                    lng: -99.019282
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT4'){
                destino = {
                    lat: 19.397750, 
                    lng: -99.214158
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT5'){
                destino = {
                   lat: 19.431264, 
                   lng: -99.150734
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT6'){
                destino = {
                    lat: 19.467077, 
                    lng: -99.158303
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT7'){
                destino = {
                    lat: 19.345729, 
                    lng: -99.027074
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT8'){
                destino = {
                    lat: 19.487481, 
                    lng: -99.174537
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT9'){
                destino = {
                    lat: 19.454125,  
                    lng: -99.175012 
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT10'){
                destino = {
                    lat: 19.454408, 
                    lng: -99.213178
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT11'){
                destino = {
                    lat: 19.454163, 
                    lng: -99.165673
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT12'){
                destino = {
                    lat: 19.463065, 
                    lng: -99.152241
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT13'){
                destino = {
                    lat: 19.340892, 
                    lng: -99.129001
                }
            }
            if(document.getElementById('puntoF').value == 'CECyT14'){
                destino = {
                    lat: 19.447272, 
                    lng: -99.115178 
                }
            }
            console.log(destino)

            var request = {
                origin: {
                    lat: latitude,
                    lng: longitude
                },
                destination: destino,
                travelMode: 'DRIVING',
                
            }

        directionsService.route(request, function (result, status){
            if (status === 'OK') {
                console.log(result.routes[0].legs[0].distance.text, result.routes[0].legs[0].duration.text)
                var km = result.routes[0].legs[0].distance.text
                document.getElementById('kilometros').value = km.substring(0,4)
               
                var seg = result.routes[0].legs[0].duration.text
                document.getElementById('tiempo').value = seg.substring(0,2)
                //display route
                directionsDisplay.setDirections(result);

        } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      
        
    
    }

