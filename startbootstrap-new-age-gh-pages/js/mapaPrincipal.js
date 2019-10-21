var output = document.getElementById('map')
var latitude = '';
var longitude = '';
var nombreEstudiante = document.getElementById('nombreUsuario').innerHTML
//Soporta geolocalizacFión
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
    //opciones del mapa
    var options = {
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
    }

    //mapa nuevo
    var map = new google.maps.Map(document.getElementById('map'), options)

    //Funcion para agregar marcadores


    function addMarkerGeolocation(coords, icono, nombre) {
        var icon = {
            url: icono, // url
            scaledSize: new google.maps.Size(50, 50), // scaled size
            origin: new google.maps.Point(0, 0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
        };

        var marker = new google.maps.Marker({
            position: coords,
            icon: icon,
            map: map
        });

        var infoWindow = new google.maps.InfoWindow({
            content: nombre,
        })

        marker.addListener('click', () => {
            infoWindow.open(map, marker)
        })
    }

    addMarkerGeolocation({ lat: latitude, lng: longitude }, '../img/student.png', nombreEstudiante)

    //CECYT1
    addMarkerGeolocation({ lat: 19.466909, lng: -99.090682 }, '../img/cecyt/cecyt1.png', 'Centro de Estudios Científicos y Tecnológicos 1 "Gonzalo Vázquez Vela"')

    //CECYT2
    addMarkerGeolocation({ lat: 19.452222, lng: -99.213178 }, '../img/cecyt/cecyt2.png', 'Centro de Estudios Científicos y Tecnológicos 2 "Miguel Bernard"')
    
    //CECYT3
    addMarkerGeolocation({ lat: 19.571034, lng: -99.019282 }, '../img/cecyt/cecyt3.png', 'Centro de Estudios Científicos y Tecnológicos 3 "Estanislao Ramírez Ruíz"')

    //CECYT4
    addMarkerGeolocation({ lat: 19.397750, lng: -99.214158 }, '../img/cecyt/cecyt4.png', 'Centro de Estudios Científicos y Tecnológicos 4 "Lázaro Cárdenas"')
    
    //CECYT5
    addMarkerGeolocation({ lat: 19.431264, lng: -99.150734 }, '../img/cecyt/cecyt5.png', 'Centro de Estudios Científicos y Tecnológicos 5 "Benito Juárez García"')

    //CECYT6
    addMarkerGeolocation({ lat: 19.467077, lng: -99.158303 }, '../img/cecyt/cecyt6.png', 'Centro de Estudios Científicos y Tecnológicos 6 "Miguel Othón de Mendizába"')
    
    //CECYT7
    addMarkerGeolocation({ lat: 19.345729, lng: -99.027074 }, '../img/cecyt/cecyt7.png', 'Centro de Estudios Científicos y Tecnológicos 7 "Cuauhtémoc"')

    //CECYT8
    addMarkerGeolocation({ lat: 19.487481, lng: -99.174537 }, '../img/cecyt/cecyt8.png', 'Centro de Estudios Científicos y Tecnológicos 8 "Narciso Bassols"')
    
    //CECYT9
    addMarkerGeolocation({ lat: 19.454125, lng: -99.175012 }, '../img/cecyt/cecyt9.png', 'Centro de Estudios Científicos y Tecnológicos 9 "Juan de Dios Bátiz"')

    //CECYT10
    addMarkerGeolocation({ lat: 19.454408, lng: -99.213178 }, '../img/cecyt/cecyt10.png', 'Centro de Estudios Científicos y Tecnológicos 10 "Carlos Vallejo Márquez"')
    
    //CECYT11
    addMarkerGeolocation({ lat: 19.454163, lng: -99.165673 }, '../img/cecyt/cecyt11.png', 'Centro de Estudios Científicos y Tecnológicos 11 "Wilfrido Massieu"')

    //CECYT12
    addMarkerGeolocation({ lat: 19.463065, lng: -99.152241 }, '../img/cecyt/cecyt12.png', 'Centro de Estudios Científicos y Tecnológicos 12 "José María Morelos"')
    
    //CECYT13
    addMarkerGeolocation({ lat: 19.340892, lng: -99.129001 }, '../img/cecyt/cecyt13.png', 'Centro de Estudios Científicos y Tecnológicos 13 "Ricardo Flores Magón"')

    //CECYT14
    addMarkerGeolocation({ lat: 19.447272, lng: -99.115178 }, '../img/cecyt/cecyt14.png', 'Centro de Estudios Científicos y Tecnológicos 14 "Luis Enrique Erro Soler"')


}
