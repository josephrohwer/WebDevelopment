$(document).ready(function () {
    loadUsers();

    $('#add-user-button').click(function (event) {

        var haveValidationErrors = checkAndDisplayValidationErrors($('#add-user-form').find('input'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8084/PlanetTracker/user',
            data: JSON.stringify({
                username: $('#add-username').val(),
                password: $('#add-password').val(),
                authorities: [$('#add-authority').val()]
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            success: function (data, status) {
                $('#errorMessages').empty();
                $('#add-username').val('');
                $('#add-password').val('');
                $('#add-authority').val('');
                loadUsers();
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

function loadUsers() {
    clearUserTable();

    var contentRows = $('#contentRows');

    $.ajax({
        type: 'GET',
        url: 'http://localhost:8084/PlanetTracker/users',
        success: function (data, status) {
            $.each(data, function (index, user) {
                var username = user.username;

                var row = '<tr>';
                row += '<td>' + username + '</td>';
                row += '<td><a onclick="deleteUser(\'' + username + '\')"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';
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

function clearUserTable() {
    $('#contentRows').empty();
}

function deleteUser(username) {
    var answer = confirm("Do you really want to delete this user?");
    if (answer === true) {
        $.ajax({
            type: 'DELETE',
            url: "http://localhost:8084/PlanetTracker/user/" + username,
            success: function (status) {
                loadUsers();
            }
        });
    }
}

function checkAndDisplayValidationErrors(input) {
    $('#errorMessages').empty();
    var errorMessages = [];

    input.each(function () {
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