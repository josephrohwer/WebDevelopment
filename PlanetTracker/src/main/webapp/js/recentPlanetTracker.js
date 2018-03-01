$(document).ready(function () {
    loadRecentPlanets();
});

function loadRecentPlanets() {
    clearRecentPlanets();

    var recentPlanets = $('#recent-planets');

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/planetsRecent',
        success: function (data, status) {
            $.each(data, function (index, planet) {
                var id = planet.planetId;
                var imageURL = planet.imageURL;
                var name = planet.name;
                var planetType = planet.planetType;

                var planetBox = '<div class="col-md-4"><div class="thumbnail">';
                planetBox += '<a data-toggle="modal" href="#planet-details-modal" id="' + id + '">';
                planetBox += '<img class="cover" src="' + imageURL + '" id="recent-planet">';
                planetBox += '<div class="caption"><p>' + name + ' - ' + planetType + '</p>';
                planetBox += '</div></a></div></div>';

                recentPlanets.append(planetBox);
            });
        },
        error: function () {
            $('#error-messages')
                    .append($('<li>')
                            .attr({class: 'list-group-item list-group-item-danger'})
                            .text('Error calling web service. Please try again later.'));
        }
    });
}

function clearRecentPlanets() {
    $('#recent-planets').empty();
}

$('#planet-details-modal').on('shown.bs.modal', function (event) {
    var element = $(event.relatedTarget);
    var planetId = element.attr("id");
    var imageURLDetails = document.getElementById('detail-image-url');
    var nameDetails = document.getElementById('detail-name');
    var avgTempDetails = document.getElementById('detail-avg-temp');
    var radLevelDetails = document.getElementById('detail-rad-level');
    var planetTypeDetails = document.getElementById('detail-planet-type');
    var lifeTypeDetails = document.getElementById('detail-life-type');

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/planet/' + planetId,
        success: function (data, status) {
            imageURLDetails.innerHTML = ('<img class="cover" id="detail-image" src="' + data.imageURL + '">');
            nameDetails.innerHTML = data.name;
            avgTempDetails.innerHTML = data.avgTemp + " (F)";
            radLevelDetails.innerHTML = data.radLevel + " (Sv)";
            planetTypeDetails.innerHTML = data.planetType;
            lifeTypeDetails.innerHTML = data.lifeType;
        },
        error: function () {
            $('#error-messages')
                    .append($('<li>')
                            .attr({class: 'list-group-item list-group-item-danger'})
                            .text('Error calling web service. Please try again later.'));
        }
    });
});
