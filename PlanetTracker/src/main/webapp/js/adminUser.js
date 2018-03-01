$(document).ready(function () {
    loadUsers();

    $('#add-user-button').click(function (event) {

        var haveValidationErrors = checkAndDisplayModalValidationErrors($('#add-user-form').find('input'), $('#add-user-form').find('select'));

        if (haveValidationErrors) {
            return false;
        }

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8084/PlanetTracker/createUser',
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
                $('#error-messages').empty();
                $('#add-username').val('');
                $('#add-password').val('');
                $('#add-authority').val('');
                loadUsers();
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

function loadUsers() {
    clearUserTable();

    var contentRows = $('#content-rows');

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
            $('#error-messages')
                    .append($('<li>')
                            .attr({class: 'list-group-item list-group-item-danger'})
                            .text('Error calling web service. Please try again later.'));
        }
    });
}

function clearUserTable() {
    $('#content-rows').empty();
}

$('#add-user-modal').on('shown.bs.modal', function (event) {
    $('#modal-error-messages').empty();
});

function deleteUser(username) {
    var answer = confirm("Do you really want to delete this user?");
    if (answer === true) {
        $.ajax({
            type: 'DELETE',
            url: "http://localhost:8084/PlanetTracker/user/" + encodeURIComponent(username) + "/",
            success: function (status) {
                loadUsers();
            }
        });
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