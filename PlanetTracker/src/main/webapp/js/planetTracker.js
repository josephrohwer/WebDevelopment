$(document).ready(function () {
    loadPlanets();

    $('#add-planet-button').click(function (event) {

        var haveValidationErrors = checkAndDisplayModalValidationErrors($('#add-planet-form').find('input'), $('#add-planet-form').find('select'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8084/PlanetTracker/planet',
            data: JSON.stringify({
                imageURL: $('#add-image-url').val(),
                name: $('#add-name').val(),
                avgTemp: $('#add-avg-temp').val(),
                radLevel: $('#add-rad-level').val(),
                lifeType: $('#add-life-type').val(),
                planetType: $('#add-planet-type').val()
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            success: function (data, status) {
                $('#error-messages').empty();
                $('#add-image-url').val('');
                $('#add-name').val('');
                $('#add-avg-temp').val('');
                $('#add-rad-level').val('');
                $('#add-life-type').val('');
                $('#add-planet-type').val('');
                loadPlanets();
            },
            error: function () {
                $('#error-messages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service. Please try again later.'));
            }
        });
    });

    $('#edit-planet-button').click(function (event) {
        var haveValidationErrors = checkAndDisplayValidationErrors($('#edit-form').find('input'), $('#edit-form').find('select'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'PUT',
            url: 'http://localhost:8084/PlanetTracker/editPlanet/' + $('#edit-planet-id').val(),
            data: JSON.stringify({
                planetId: $('#edit-planet-id').val(),
                imageURL: $('#edit-image-url').val(),
                name: $('#edit-name').val(),
                avgTemp: $('#edit-avg-temp').val(),
                radLevel: $('#edit-rad-level').val(),
                planetType: $('#edit-planet-type').val(),
                lifeType: $('#edit-life-type').val()
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            success: function () {
                $('#error-messages').empty();
                hideEditForm();
                loadPlanets();
            },
            error: function () {
                $('#error-messages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service. Please try again later.'));
            }
        });
    });

    $('#search-button').click(function (event) {
        var haveValidationErrors = checkAndDisplayValidationErrors($('#search-form').find('input'), $('#search-form').find('select'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8084/PlanetTracker/searchPlanets',
            data: JSON.stringify({
                name: $('#search-name').val(),
                avgTemp: $('#search-avg-temp').val(),
                radLevel: $('#search-rad-level').val(),
                planetType: $('#search-planet-type').val(),
                lifeType: $('#search-life-type').val()
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            success: function (data) {
                $('#error-messages').empty();
                loadSearchResults(data);
            },
            error: function () {
                $('#error-messages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service. Please try again later.'));
            }
        });
    });
});

function loadPlanets() {
    clearPlanetTable();

    var isAdmin = $('#is-admin').val();
    var contentRows = $('#content-rows');

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/planets',
        success: function (data, status) {
            $.each(data, function (index, planet) {
                var name = planet.name;
                var planetType = planet.planetType;
                var id = planet.planetId;

                var row = '<tr>';
                row += '<td><a data-toggle="modal" href="#planet-details-modal" id="' + id + '">' + name + '</a></td>';
                row += '<td>' + planetType + '</td>';
                if (isAdmin === "true") {
                    row += '<td><a onclick="showEditForm(' + id + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>';
                    row += '<td><a onclick="deletePlanet(' + id + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';
                }
                row += '</tr>';
                contentRows.append(row);
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

function loadSearchResults(data) {
    clearPlanetTable();

    var isAdmin = $('#is-admin').val();
    var contentRows = $('#content-rows');

    $.each(data, function (index, planet) {
        var name = planet.name;
        var planetType = planet.planetType;
        var id = planet.planetId;

        var row = '<tr>';
        row += '<td><a data-toggle="modal" href="#planet-details-modal" id="' + id + '">' + name + '</a></td>';
        row += '<td>' + planetType + '</td>';
        if (isAdmin === "true") {
            row += '<td><a onclick="showEditForm(' + id + ')"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>';
            row += '<td><a onclick="deletePlanet(' + id + ')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';
        }
        row += '</tr>';
        contentRows.append(row);
    });
}

function clearPlanetTable() {
    $('#content-rows').empty();
}

$('#add-planet-modal').on('shown.bs.modal', function (event) {
    $('#modal-error-messages').empty();
});

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

function showEditForm(planetId) {
    $('#error-messages').empty();

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/planet/' + planetId,
        success: function (data, status) {
            $('#edit-image-url').val(data.imageURL);
            $('#edit-name').val(data.name);
            $('#edit-avg-temp').val(data.avgTemp);
            $('#edit-rad-level').val(data.radLevel);
            $('#edit-planet-type').val(data.planetType);
            $('#edit-life-type').val(data.lifeType);
            $('#edit-planet-id').val(data.planetId);
        },
        error: function () {
            $('#error-messages')
                    .append($('<li>')
                            .attr({class: 'list-group-item list-group-item-danger'})
                            .text('Error calling web service. Please try again later.'));
        }
    });
    $('#planet-table-div').hide();
    $('#edit-form-div').show();
}

function hideEditForm() {
    $('#error-messages').empty();
    $('#edit-image-url').val('');
    $('#edit-name').val('');
    $('#edit-avg-temp').val('');
    $('#edit-rad-level').val('');
    $('#edit-life-type').val('');
    $('#edit-planet-type').val('');
    $('#edit-form-div').hide();
    $('#planet-table-div').show();
}

function deletePlanet(planetId) {
    var answer = confirm("Do you really want to delete this planet?");
    if (answer === true) {
        $.ajax({
            type: 'DELETE',
            url: "http://localhost:8084/PlanetTracker/deletePlanet/" + planetId,
            success: function (status) {
                loadPlanets();
            }
        });
    }
}

function checkAndDisplayValidationErrors(input, select) {
    $('#error-messages').empty();
    var errorMessages = [];

    input.each(function () {
        if (!this.validity.valid)
        {
            var errorField = $('label[for=' + this.id + ']').text();
            errorMessages.push(errorField + ': ' + this.validationMessage);
        }
    });

    select.each(function () {
        if (!this.validity.valid)
        {
            var errorField = $('label[for=' + this.id + ']').text();
            errorMessages.push(errorField + ': ' + this.validationMessage);
        }
    });

    if (errorMessages.length > 0) {
        $.each(errorMessages, function (index, message) {
            $('#error-messages').append($('<li>').attr({class: 'list-group-item list-group-item-danger'}).text(message));
        });
        return true;
    } else {
        return false;
    }
}

function checkAndDisplayModalValidationErrors(input, select) {
    $('#modal-error-messages').empty();
    var modalErrorMessages = [];

    input.each(function () {
        if (!this.validity.valid)
        {
            var errorField = $('label[for=' + this.id + ']').text();
            modalErrorMessages.push(errorField + ': ' + this.validationMessage);
        }
    });

    select.each(function () {
        if (!this.validity.valid)
        {
            var errorField = $('label[for=' + this.id + ']').text();
            modalErrorMessages.push(errorField + ': ' + this.validationMessage);
        }
    });

    if (modalErrorMessages.length > 0) {
        $.each(modalErrorMessages, function (index, message) {
            $('#modal-error-messages').append($('<li>').attr({class: 'list-group-item list-group-item-danger'}).text(message));
        });
        return true;
    } else {
        return false;
    }
}
