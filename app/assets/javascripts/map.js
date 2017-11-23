var map;

AmCharts.ready(function() {
    map = new AmCharts.AmMap();


    map.balloon.color = "#000000";

    var dataProvider = {
        mapVar: AmCharts.maps.worldHigh,
        getAreasFromMap:true
    };

    map.dataProvider = dataProvider;

    map.areasSettings = {
        autoZoom: true,
        selectedColor: "#CC0000"
    };

    

    map.write("map");

});
