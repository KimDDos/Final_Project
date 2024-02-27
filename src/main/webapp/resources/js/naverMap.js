let select = 0;
var map;
var STitle = document.getElementById("selTitle");
var SAddress = document.getElementById("selAddress");
var submitBtn = document.getElementById("selSub");
map = new naver.maps.Map("aboutmap52", {
    center: markers.length ? new naver.maps.LatLng(markers[0].x, markers[0].y) : new naver.maps.LatLng(37.3595316, 127.1052133),
    zoom: markers.length ? 19 : 13,
    mapTypeControl: true
});

var marker = [];

for (let i = 0; i < markers.length; i++) {
    var temp = new naver.maps.Marker({
        position: new naver.maps.LatLng(markers[i].x, markers[i].y),
        map: map
    });

    marker.push(temp);

    var contentString = [
        '<div class="iw_inner">',
        `   <h3>${markers[i].title}</h3>`,
        `   <p>${markers[i].address}<br />`,
        `       <a href="${markers[i].link}" target="_blank">${markers[i].link}</a>`,
        '   </p>',
        '</div>'
    ].join('');

    var infoWindow2 = new naver.maps.InfoWindow({
        anchorSkew: true,
        content: contentString
    });

    naver.maps.Event.addListener(marker[i], "click", function (e) {
        console.log(marker[i].position.x);
        console.log(marker[i].position.y);
        var templat = new naver.maps.LatLng(markers[i].x, markers[i].y);
        if (infoWindow2.getMap()) {
            if (i != select) {
                console.log("DIFFERENT SELECT");
                select = i;
                infoWindow2.close();
                infoWindow2.open(map, marker[i]);
            }
            else {
                console.log("SAME SELECT");
                infoWindow2.close();
            }
        } else {
            select = i;
            infoWindow2.open(map, marker[i]);
        }
        SAddress.value = markers[i].address;
        STitle.value = markers[i].title;
        
        map.morph(templat);
    });

    document.getElementById(`MList${i}`).addEventListener("click", function () {
        var templat = new naver.maps.LatLng(markers[i].x, markers[i].y);
        if (infoWindow2.getMap()) {
            if (i != select) {
                console.log("DIFFERENT SELECT");
                select = i;
                infoWindow2.close();
                infoWindow2.open(map, marker[i]);
            }
            else {
                console.log("SAME SELECT");
                infoWindow2.close();
            }
        }
        else {
            select = i;
            infoWindow2.open(map, marker[i]);
        }
        SAddress.value = markers[i].address;
        STitle.value = markers[i].title;
        submitBtn.style.visibility="visible";
        map.morph(templat);
    })
}


map.setCursor('pointer');

function searchCoordinateToAddress(latlng) {

    infoWindow2.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function (status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,
            address = '',
            htmlAddresses = [];

        for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i + 1) + '. ' + addrType + ' ' + address);
        }

        infoWindow2.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        infoWindow2.open(map, latlng);
    });
}

function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function (status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('totalCount' + response.v2.meta.totalCount);
        }

        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);

        if (item.roadAddress) {
            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
        }

        if (item.jibunAddress) {
            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }

        if (item.englishAddress) {
            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
        }

        infoWindow2.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 주소 : ' + address + '</h4><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        map.setCenter(point);
        infoWindow2.open(map, point);
    });
}

function initGeocoder() {
    map.addListener('click', function (e) {
        searchCoordinateToAddress(e.coord);
    });

    $('#address').on('keydown', function (e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });

    $('#submit').on('click', function (e) {
        e.preventDefault();

        searchAddressToCoordinate($('#address').val());
    });

    searchAddressToCoordinate('정자동 178-1');
}

function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,
        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString(word, lastString) {
    return new RegExp(lastString + '$').test(word);
}

function hasAddition(addition) {
    return !!(addition && addition.value);
}

naver.maps.onJSContentLoaded = initGeocoder;