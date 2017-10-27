/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    loadPlanets();

    $('#add-button').click(function (event) {

        var haveValidationErrors = checkAndDisplayValidationErrors($('#add-form').find('input'), $('#add-form').find('select'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8084/PlanetTracker/planet',
            data: JSON.stringify({
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
                $('#errorMessages').empty();
                $('#add-name').val('');
                $('#add-avg-temp').val('');
                $('#add-rad-level').val('');
                $('#add-life-type').val('');
                $('#add-planet-type').val('');
                loadPlanets();
            },
            error: function () {
                $('#errorMessages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service.  Please try again later.'));
            }
        });
    });

    $('#edit-button').click(function (event) {
        var haveValidationErrors = checkAndDisplayValidationErrors($('#edit-form').find('input'), $('#edit-form').find('select'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'PUT',
            url: 'http://localhost:8084/PlanetTracker/planet/' + $('#edit-planet-id').val(),
            data: JSON.stringify({
                planetId: $('#edit-planet-id').val(),
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
                $('#errorMessages').empty();
                hideEditForm();
                loadPlanets();
            },
            error: function () {
                $('#errorMessages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service.  Please try again later.'));
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
            url: 'http://localhost:8084/PlanetTracker/search/planets',
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
                $('#errorMessages').empty();
                loadSearchResults(data);
            },
            error: function () {
                $('#errorMessages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service.  Please try again later.'));
            }
        });
    });
});

function loadPlanets() {
    clearPlanetTable();

    var contentRows = $('#contentRows');

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/planets',
        success: function (data, status) {
            $.each(data, function (index, planet) {
                var name = planet.name;
                var planetType = planet.planetType;
                var id = planet.planetId;

                var row = '<tr>';
                row += '<td>' + name + '</td>';
                row += '<td>' + planetType + '</td>';
                row += '<td><a onclick="showEditForm(' + id + ')">Edit</a></td>';
                row += '<td><a onclick="deletePlanet(' + id + ')">Delete</a></td>';
                row += '</tr>';
                contentRows.append(row);
            });
        },
        error: function () {
            $('#errorMessages')
                    .append($('<li>')
                            .attr({class: 'list-group-item list-group-item-danger'})
                            .text('Error calling web service.  Please try again later.'));
        }
    });
}

function loadSearchResults(data) {
    clearPlanetTable();

    var contentRows = $('#contentRows');

    $.each(data, function (index, planet) {
        var name = planet.name;
        var planetType = planet.planetType;
        var id = planet.planetId;
        
        var row = '<tr>';
        row += '<td>' + name + '</td>';
        row += '<td>' + planetType + '</td>';
        row += '<td><a onclick="showEditForm(' + id + ')">Edit</a></td>';
        row += '<td><a onclick="deletePlanet(' + id + ')">Delete</a></td>';
        row += '</tr>';
        contentRows.append(row);
    });
}

function clearPlanetTable() {
    $('#contentRows').empty();
}

function showEditForm(planetId) {
    $('#errorMessages').empty();

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/planet/' + planetId,
        success: function (data, status) {
            $('#edit-name').val(data.name);
            $('#edit-avg-temp').val(data.avgTemp);
            $('#edit-rad-level').val(data.radLevel);
            $('#edit-planet-type').val(data.planetType);
            $('#edit-life-type').val(data.lifeType);
            $('#edit-planet-id').val(data.planetId);
        },
        error: function () {
            $('#errorMessages')
                    .append($('<li>')
                            .attr({class: 'list-group-item list-group-item-danger'})
                            .text('Error calling web service.  Please try again later.'));
        }
    });
    $('#planetTableDiv').hide();
    $('#editFormDiv').show();
}

function hideEditForm() {
    $('#errorMessages').empty();
    $('#edit-name').val('');
    $('#edit-avg-temp').val('');
    $('#edit-rad-level').val('');
    $('#edit-life-type').val('');
    $('#edit-planet-type').val('');
    $('#editFormDiv').hide();
    $('#planetTableDiv').show();
}

function deletePlanet(planetId) {
    var answer = confirm("Do you really want to delete this planet?");
    if (answer === true) {
        $.ajax({
            type: 'DELETE',
            url: "http://localhost:8084/PlanetTracker/planet/" + planetId,
            success: function (status) {
                loadPlanets();
            }
        });
    }
}

function checkAndDisplayValidationErrors(input, select) {
    $('#errorMessages').empty();
    var errorMessages = [];

    input.each(function () {
        if (!this.validity.valid)
        {
            var errorField = $('label[for=' + this.id + ']').text();
            errorMessages.push(errorField + ' ' + this.validationMessage);
        }
    });

    select.each(function () {
        if (!this.validity.valid)
        {
            var errorField = $('label[for=' + this.id + ']').text();
            errorMessages.push(errorField + ' ' + this.validationMessage);
        }
    });

    if (errorMessages.length > 0) {
        $.each(errorMessages, function (index, message) {
            $('#errorMessages').append($('<li>').attr({class: 'list-group-item list-group-item-danger'}).text(message));
        });
        return true;
    } else {
        return false;
    }
}
