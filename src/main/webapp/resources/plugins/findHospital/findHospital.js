if (navigator.geolocation) {
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {

		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex: 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
			markers = [], // 마커를 담을 배열입니다
			currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				leve: 5  // 지도의 확대 레벨
			};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
			if (!currCategory) {
				return;
			}

			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			ps.categorySearch(currCategory, placesSearchCB, {
				useMapBounds: true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				const excludedStrings = ["치과", "안과", "산부인과", "피부과", "동물", "성형외과", "비뇨기과", "한방", "정형"]; // 제외할 문자열들을 배열로 정의합니다.
				const filteredData = data.filter(item => !excludedStrings.some(str => item.category_name.includes(str)));

				console.log(filteredData);
				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces(filteredData);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
				alert("현재 지도에서 찾고싶은 장소가 없어요")
			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
				alert("알수 없는 오류로 인해 장소를 찾을 수가 없어요")
			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute('data-order');

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
				})(marker, places[i]);
			}
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
			 var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
				imgOptions = {
					spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
					spriteOrigin: new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset: new kakao.maps.Point(11, 28)// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker({
					position: position, // 마커의 위치
					image: markerImage
				});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 정보 창이 div 화면을 벗어나면 다른 지역에 표시되도록 처리합니다
		function checkOverlayPosition() {
			var overlayPosition = placeOverlay.getPosition();
			var mapBounds = map.getBounds();

			if (overlayPosition && mapBounds && !mapBounds.isEmpty() && !isPositionInBounds(overlayPosition, mapBounds)) {
				// 정보 창의 좌표가 지도의 경계를 벗어나는 경우 다른 위치에 정보 창을 표시합니다
				var newOverlayPosition = mapBounds.getCenter();

				// 정보 창을 닫고 새 위치에 표시합니다
				placeOverlay.setMap(null);
				placeOverlay.setPosition(newOverlayPosition);
				placeOverlay.setMap(map);
			}
		}

		// 좌표가 경계 내에 있는지 확인하는 함수입니다
		function isPositionInBounds(position, bounds) {
			var southWest = bounds.getSouthWest();
			var northEast = bounds.getNorthEast();
			var lngInRange = position.getLng() >= southWest.getLng() && position.getLng() <= northEast.getLng();
			var latInRange = position.getLat() >= southWest.getLat() && position.getLat() <= northEast.getLat();
			return lngInRange && latInRange;
		}


		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">'
				+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
				+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
					+ place.road_address_name
					+ '</span>'
					+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
					+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
					+ place.address_name + '</span>';
			}

			content += '    <span class="tel">' + place.phone + '</span>'
				+ '</div>' + '<div class="after"></div>';

			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
			checkOverlayPosition();
		}


		// 지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function() {
			placeOverlay.setMap(null); // 정보 창을 닫습니다
		});

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;

			placeOverlay.setMap(null);

			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				removeMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				searchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}


	});

} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '현재 위치 정보를 불러올 수 없어요'

	displayMarker(locPosition, message);
}