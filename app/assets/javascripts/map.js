var map;
AmCharts.ready(function() {
    map = new AmCharts.AmMap();
    map.balloon.color = "#ffab00";
    map.dataProvider = {
      mapVar: AmCharts.maps.worldLow,
      getAreasFromMap: true,

    }
    map.areasSettings = {
        autoZoom: true,
        selectedColor: "#CC0000",
        balloonText: "número de hablantes de X idioma en ese país"
    };
    map.write("map");
});
