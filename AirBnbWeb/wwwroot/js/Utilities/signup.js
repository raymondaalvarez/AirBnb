
function DisplaySignupModal() {
    $("#modal-signup").addClass("is-active");
}

function RemoveSignupModal() {
    $("#modal-signup").removeClass("is-active");
}

function IsValidEmail(event) {
    console.log(event.value);
    var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (event.value.match(mailFormat)) {
        HelpMessage(true);
    }
    else {
        HelpMessage(false);
    }
}

function HelpMessage(bool) {
    if (bool) {

        if ($("#signup-email-validator-help").hasClass("is-danger")) {
            $("#signup-email-validator-help").toggleClass("is-primary is-danger");
        } else {
            $("#signup-email-validator-help").addClass("is-primary");
        }

        if ($("#signup-warning-icon").hasClass("fa-exclamation-triangle")) {
            $("#signup-warning-icon").toggleClass("fa-check fa-exclamation-triangle");
        } else {
            $("#signup-warning-icon").addClass("fa-check");
        }

        if ($("#email-input").hasClass("is-danger")) {
            $("#email-input").toggleClass("is-primary is-danger");

        } else {
            $("#email-input").addClass("is-primary");
        }
        $("#signup-email-validator-help").text("");
    } else {
        if ($("#signup-email-validator-help").hasClass("is-primary")) {
            $("#signup-email-validator-help").toggleClass("is-danger is-primary");
        } else {
            $("#signup-email-validator-help").addClass("is-danger");
        }

        if ($("#signup-warning-icon").hasClass("fa-check")) {
            $("#signup-warning-icon").toggleClass("fa-exclamation-triangle fa-check");
        } else {
            $("#signup-warning-icon").addClass("fa-exclamation-triangle");
        }

        if ($("#email-input").hasClass("is-primary")) {
            $("#email-input").toggleClass("is-primary is-danger");
        } else {
            $("#email-input").addClass("is-danger");
        }
        $("#signup-email-validator-help").text("This email is invalid");
    }
}

function PasswordsMatch(event) {
    var pass2 = event.value;
    console.log(pass2);
    var pass1 = $("#password1").val();
    console.log(pass1);
    if (pass2 == pass1) {
        $("#signup-password-validator-help").text("")
    } else {
        $("#signup-password-validator-help").text("Passwords do not match");
        $("#signup-password-validator-help").addClass("is-danger");
    }
}
