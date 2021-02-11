function DisplayLoginModal() {
    $("#modal-login").addClass("is-active");
}

function RemoveLoginModal() {
    $("#modal-login").removeClass("is-active");
}

function IsValidEmailLogin(event) {
    console.log(event.value);
    var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (event.value.match(mailFormat)) {
        HelpMessageLogin(true);
    }
    else {
        HelpMessageLogin(false);
    }
}

function HelpMessageLogin(bool) {
    if (bool) {

        if ($("#login-email-validator-help").hasClass("is-danger")) {
            $("#login-email-validator-help").toggleClass("is-primary is-danger");
        } else {
            $("#login-email-validator-help").addClass("is-primary");
        }

        if ($("#login-warning-icon").hasClass("fa-exclamation-triangle")) {
            $("#login-warning-icon").toggleClass("fa-check fa-exclamation-triangle");
        } else {
            $("#login-warning-icon").addClass("fa-check");
        }

        if ($("#email-input-login").hasClass("is-danger")) {
            $("#email-input-login").toggleClass("is-primary is-danger");

        } else {
            $("#email-input").addClass("is-primary");
        }
        $("#login-email-validator-help").text("");
    } else {
        if ($("#login-email-validator-help").hasClass("is-primary")) {
            $("#login-email-validator-help").toggleClass("is-danger is-primary");
        } else {
            $("#login-email-validator-help").addClass("is-danger");
        }

        if ($("#login-warning-icon").hasClass("fa-check")) {
            $("#login-warning-icon").toggleClass("fa-exclamation-triangle fa-check");
        } else {
            $("#login-warning-icon").addClass("fa-exclamation-triangle");
        }

        if ($("#email-input-login").hasClass("is-primary")) {
            $("#email-input-login").toggleClass("is-primary is-danger");
        } else {
            $("#email-input-login").addClass("is-danger");
        }
        $("#login-email-validator-help").text("This email is invalid");
    }
}