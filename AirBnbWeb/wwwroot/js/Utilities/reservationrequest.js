var home = "https://cloudbnb.azurewebsites.net/"
//var ReservationRequestBase = "http://localhost:4900/reservationrequest"
var ReservationRequestBase = "https://cloudbnb.azurewebsites.net/reservationrequest"
var ReservationRequestPost = "/CreateReservationRequest"

function AjaxReservationRequest() {
    let form = $("#ReservationRequestForm");
    $.ajax({
        method: "POST",
        url: ReservationRequestBase + ReservationRequestPost,
        data: form.serialize()

    }).done(function (data) {
        console.log(data);
        window.location = home;
    });
}

function OpenStartDateRange()
{
    console.log("Open range picker");
    $('input[name="checkIn"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        opens: 'center'
    });
}

function OpenEndDateRange() {
    console.log("Open range picker");
    $('input[name="checkOut"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        opens: 'center'
    });
}

function DisplayReservationRequestModal() {
    $("#modal-reservation-request").addClass("is-active");
}

function RemoveReservationRequestModal() {
    $("#modal-reservation-request").removeClass("is-active");
}

function IsValidEmailReservationRequest(event) {
    console.log(event.value);
    var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (event.value.match(mailFormat)) {
        HelpMessageReservationRequest(true);
    }
    else {
        HelpMessageReservationRequest(false);
    }
}

function HelpMessageReservationRequest(bool) {
    if (bool) {

        if ($("#reservation-request-email-validator-help").hasClass("is-danger")) {
            $("#reservation-request-email-validator-help").toggleClass("is-primary is-danger");
        } else {
            $("#reservation-request-email-validator-help").addClass("is-primary");
        }

        if ($("#reservation-request-warning-icon").hasClass("fa-exclamation-triangle")) {
            $("#reservation-request-warning-icon").toggleClass("fa-check fa-exclamation-triangle");
        } else {
            $("#reservation-request-warning-icon").addClass("fa-check");
        }

        if ($("#reservation-request-email-input").hasClass("is-danger")) {
            $("#reservation-request-email-input").toggleClass("is-primary is-danger");

        } else {
            $("#reservation-request-email-input").addClass("is-primary");
        }
        $("#reservation-request-email-validator-help").text("");
    } else {
        if ($("#reservation-request-email-validator-help").hasClass("is-primary")) {
            $("#reservation-request-email-validator-help").toggleClass("is-danger is-primary");
        } else {
            $("#reservation-request-email-validator-help").addClass("is-danger");
        }

        if ($("#reservation-request-warning-icon").hasClass("fa-check")) {
            $("#reservation-request-warning-icon").toggleClass("fa-exclamation-triangle fa-check");
        } else {
            $("#reservation-request-warning-icon").addClass("fa-exclamation-triangle");
        }

        if ($("#reservation-request-email-input").hasClass("is-primary")) {
            $("#reservation-request-email-input").toggleClass("is-primary is-danger");
        } else {
            $("#reservation-request-email-input").addClass("is-danger");
        }
        $("#reservation-request-email-validator-help").text("This email is invalid");
    }
}